import 'package:agumentality/FurnitureMod/FunitureData.dart';
import 'package:agumentality/FurnitureMod/FurnitureDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureMod extends StatefulWidget {
  static const routename = '/furniture';
  //const FurnitureMod({Key? key}) : super(key: key);

  @override
  State<FurnitureMod> createState() => _FurnitureModState();
}

class _FurnitureModState extends State<FurnitureMod>
    with TickerProviderStateMixin {
  //Animation Var//
  List<Color> colorList = [
    const Color(0xff3022AC),
    const Color(0xff8236A3),
    Colors.indigo,
    Color(0xffC5B2D7),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = const Color(0xff3022AC);
  Color topColor = const Color(0xff7504CD);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  late AnimationController controller;
  late Animation animationcolor;
  //Animation Var//

  //Animation Fun//
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
    );
    animationcolor =
        ColorTween(begin: const Color(0xff3022AC), end: const Color(0xff1D1150))
            .animate(controller);
    controller.forward();
    animationcolor.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //controller.reverse(from: 1.0);
        setState(() {
          bottomColor = Colors.blue.shade200;
        });
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
        setState(() {
          bottomColor = Colors.indigoAccent.shade100;
        });
      }
    });
  }
  //Animation Fun//

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          height: double.maxFinite,
          width: double.maxFinite,
          duration: const Duration(seconds: 1),
          onEnd: () {
            setState(() {
              index = index + 1;
              // animate the color
              bottomColor = colorList[index % colorList.length];
              topColor = colorList[(index + 1) % colorList.length];
              //comment below two line//
              begin = alignmentList[index % alignmentList.length];
              end = alignmentList[(index + 2) % alignmentList.length];
            });
          },
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: begin, end: end, colors: [bottomColor, topColor])),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  margin: const EdgeInsets.only(top: 10, right: 330),
                  child: const FaIcon(
                    FontAwesomeIcons.chevronCircleLeft,
                    size: 40,
                    color: Colors.white60,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, right: 190),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Choose Your Best\nComfort Funiture",
                      style: GoogleFonts.lobster(
                          //backgroundColor: Colors.black12,
                          fontSize: 29,
                          color: Colors.white70),
                    ),
                    Text(
                      "\nHigh quality funiture",
                      style: GoogleFonts.roboto(
                          backgroundColor: Colors.black12,
                          fontSize: 20,
                          color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade200,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 48),
                    child: Scrollbar(
                      thickness: 6.0,
                      child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: funitureDatalst.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FurnitureDetailPage(
                                    index: index,
                                  ),
                                ),
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 9,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        leading: Container(
                                          child: Image.asset(
                                            funitureDatalst[index].image,
                                            //"assets/ChairOne.png",
                                            fit: BoxFit.contain,
                                          ),
                                          height: 90,
                                          width: 100,
                                        ),
                                        title: Text(
                                          funitureDatalst[index].name,
                                          style: GoogleFonts.mavenPro(
                                              color: Color(0xff716995),
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(
                                          '${funitureDatalst[index].subtitle}\n${funitureDatalst[index].star}⭐',
                                          style: GoogleFonts.oswald(
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 14),
                                          //textAlign: TextAlign.end,
                                        ),
                                        trailing: Text(
                                          funitureDatalst[index].price,
                                          style: GoogleFonts.zillaSlab(
                                            fontSize: 25,
                                            color: const Color(0xff312A50),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        isThreeLine: true,
                                      ),
                                    ),
                                    // Center(
                                    //   child: Container(
                                    //     child: Image.asset(
                                    //       "assets/ChairOne.png",
                                    //       fit: BoxFit.contain,
                                    //     ),
                                    //     height: 80,
                                    //     width: 90,
                                    //   ),
                                    // ),
                                    // const SizedBox(
                                    //   width: 30,
                                    // ),
                                    // Column(
                                    //   children: <Widget>[
                                    //     Text(
                                    //       "Grey chair",
                                    //       style: GoogleFonts.mavenPro(
                                    //           color: Color(0xff716995),
                                    //           fontWeight: FontWeight.w900,
                                    //           fontSize: 20),
                                    //     ),
                                    //     Text(
                                    //       'Comfortable',
                                    //       textAlign: TextAlign.end,
                                    //       style: GoogleFonts.oswald(
                                    //           color: Colors.grey.shade800,
                                    //           fontWeight: FontWeight.w400,
                                    //           fontStyle: FontStyle.italic,
                                    //           fontSize: 14),
                                    //     ),
                                    //     Row(
                                    //       children: <Widget>[
                                    //         for (int i = 0; i < 5; i++)
                                    //           const FittedBox(
                                    //             child: FaIcon(
                                    //               FontAwesomeIcons.solidStar,
                                    //               size: 17,
                                    //               color: Colors.amber,
                                    //             ),
                                    //           ),
                                    //       ],
                                    //     ),
                                    //     Text(
                                    //       '\$750.0',
                                    //       style: GoogleFonts.zillaSlab(
                                    //         fontSize: 25,
                                    //         color: Color(0xff312A50),
                                    //         fontWeight: FontWeight.w600,
                                    //       ),
                                    //     ),
                                    //   ],
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
