import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agumentality/Marvel/ICard.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class MarvelRender extends StatefulWidget {
  @override
  State<MarvelRender> createState() => _MarvelRenderState();
}

class _MarvelRenderState extends State<MarvelRender> {
  late ArCoreController arCoreController;
  var ontapindex = 0;
  var posheight = 700;
  var poswidth = 700;

  Future addMarvelCharacter(ArCoreHitTestResult hit) async {
    final bytes = (await rootBundle.load("assets/Marvel/AVG${ontapindex}.png"))
        .buffer
        .asUint8List();

    final characterPos = ArCoreNode(
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
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: whenArCoreViewCreated,
            enableTapRecognizer: true,
          ),
          Positioned(
            top: 600,
            child: Container(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 100.0,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        ontapindex = index;
                      });
                      print(ontapindex);
                    },
                    child: buildCard(
                        length: 4, index: index, ontapindex: ontapindex),
                  );
                },
              ),
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
                    color: Color(0xffD9C3FF),
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
                    color: Color(0xffD9C3FF),
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
