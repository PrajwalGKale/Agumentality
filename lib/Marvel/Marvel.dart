import 'package:flutter/material.dart';
import 'package:agumentality/Marvel/MarvelRender.dart';
import 'package:hover_effect/hover_effect.dart';

class Marvel extends StatefulWidget {
  //const Marvel({Key? key}) : super(key: key);
  static const routename = '/MarvelDCEU';
  @override
  State<Marvel> createState() => _MarvelState();
}

class _MarvelState extends State<Marvel>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  var hover1 = false;
  var hover2 = false;

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

  //Animation var//
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 260,
                  width: 260,
                  child: HoverCard(
                    builder: (context, hovering) {
                      return Center(
                          child: Container(
                        //height: 600,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: const AssetImage(
                                  "assets/MarvelMotionPoster.jpeg"),
                              fit: hover1 ? BoxFit.cover : BoxFit.fill),
                        ),
                      ));
                    },
                    depth: 9,
                    depthColor: const Color(0xff8E6DC7),
                    onTap: () {
                      setState(() {
                        hover1 = !hover1;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MarvelRender()),
                        );
                      });
                    },
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 260,
                  width: 260,
                  child: HoverCard(
                    builder: (context, hovering) {
                      return Center(
                          child: Container(
                        //height: 600,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: const AssetImage(
                                  "assets/DCMotionPoster.jpeg"),
                              fit: hover2 ? BoxFit.cover : BoxFit.fill),
                        ),
                      ));
                    },
                    depth: 9,
                    depthColor: Color(0xff8E6DC7),
                    onTap: () {
                      setState(() {
                        hover2 = !hover2;
                      });
                    },
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
