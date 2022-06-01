import 'package:agumentality/Class_package/AVGlst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agumentality/Marvel/ICard.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class MarvelRender extends StatefulWidget {
  @override
  State<MarvelRender> createState() => _MarvelRenderState();
}

class _MarvelRenderState extends State<MarvelRender> {
  late ArCoreController arCoreController;
  List avengerlst = [];
  var ontapindex = 0;
  var posheight = 700;
  var poswidth = 700;
  int length = 13;
  var characterPos;
  Future addMarvelCharacter(ArCoreHitTestResult hit) async {
    final bytes = (await rootBundle.load("assets/Marvel/AVG${ontapindex}.png"))
        .buffer
        .asUint8List();

    characterPos = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: poswidth, height: posheight),
      position: hit.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation: hit.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );
    arCoreController.addArCoreNodeWithAnchor(characterPos);
  }

  void ControlOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    //adding the char
    addMarvelCharacter(hit);

    //
  }

  void whenArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = ControlOnPlaneTap;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arCoreController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("------------->${avengerlst.length}");
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: whenArCoreViewCreated,
            enableTapRecognizer: true,
          ),
          Container(
            height: 85,
            margin: const EdgeInsets.only(top: 600),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 100.0,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      ontapindex = index;
                      avengerlst.add(AVGLST[index]);
                    });
                    print(ontapindex);
                  },
                  child: buildCard(
                      length: length, index: index, ontapindex: ontapindex),
                );
              },
            ),
          ),
          Positioned(
            top: 39,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    print("plus");
                    setState(() {
                      arCoreController.removeNode(nodeName: characterPos);
                      posheight = posheight + 100;
                      poswidth = poswidth + 80;
                    });
                    print("----------\n-------");
                    print(poswidth);
                    print(posheight);
                    print("----------\n-------");
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.plusCircle,
                    color: Color(0xff645087),
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                IconButton(
                  onPressed: () {
                    print("plus");
                    setState(() {
                      posheight = posheight - 100;
                      poswidth = poswidth - 80;
                    });
                    print("----------\n-------");
                    print(poswidth);
                    print(posheight);
                    print("----------\n-------");
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.minusCircle,
                    color: Color(0xff645087),
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          avengerlst.isEmpty == true
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.1,
                    maxChildSize: 0.5,
                    minChildSize: 0.1,
                    builder: (context, controller) => ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                      child: Container(
                        color: Color(0xff31293F),
                        child: ListView.builder(
                            //reverse: true,
                            itemCount: avengerlst.length,
                            controller: controller,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 15,
                                  color: Color(0xff7153A6),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ListTile(
                                      title: Text(
                                        "Char Name: ${avengerlst[index].charName}\n"
                                        "Real Name: ${avengerlst[index].realName}\n"
                                        "Team: ${avengerlst[index].Avenger}\n"
                                        "Planet: ${avengerlst[index].planet}\n"
                                        "Rating: ${avengerlst[index].rating}\n"
                                        "Special Ability: ${avengerlst[index].power}",
                                        style: GoogleFonts.russoOne(
                                            fontSize: 15,
                                            backgroundColor: Colors.black38,
                                            color: Colors.amber.shade300),
                                      ),
                                      subtitle: Text(
                                        "🖇🗂 More info: ${avengerlst[index].description}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            backgroundColor: Colors.black12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
