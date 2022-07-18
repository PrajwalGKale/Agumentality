import 'package:agumentality/Class_package/GlassMorphism.dart';
import 'package:agumentality/Class_package/HomePageData.dart';
import 'package:agumentality/MainCreaterPage/MEGAPAGE.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _isBlur = false;
  late AnimationController controller;
  late AnimationController controllerlogo;
  late Animation animationcolor;
  late Animation _animationlogo;
  late int activeindex = 0;
  List<Color> colorList = [
    const Color(0xff3022AC),
    const Color(0xff8236A3),
    Colors.indigo,
    Colors.deepOrangeAccent.shade100,
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

    controllerlogo =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationlogo =
        CurvedAnimation(parent: controllerlogo, curve: Curves.easeIn);
    controllerlogo.forward();
    _animationlogo.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerlogo.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controllerlogo.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
      //print(controller.value);
    });
    controllerlogo.addListener(() {
      setState(() {
        //print(controllerlogo.value);
      });
    });
  }

  BuildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: HomeDatalst.length,
        effect: const ExpandingDotsEffect(
          spacing: 8.0,
          radius: 7.0,
          dotWidth: 24.0,
          dotHeight: 16.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 3.1,
          dotColor: Colors.black26,
          activeDotColor: Color(0xffC2A5FF),
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: animationcolor.value,
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
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
                    begin: begin, end: end, colors: [bottomColor, topColor]),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        width: 6,
                      ),
                      // Container(
                      //   child: Flexible(
                      //     child: Image.asset(
                      //       "assets/VR_logo.png",
                      //       height: controllerlogo.value * 60,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 6,
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'AR- ',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontStyle: FontStyle.italic,
                                  decorationThickness: 2.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 44,
                                  color: Colors.black38),
                            ),
                            TextSpan(
                              text: 'GYM',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontStyle: FontStyle.normal,
                                  backgroundColor: Colors.black38,
                                  decorationThickness: 2.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 39,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 6.0,
                            color: Colors.white,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FlickerAnimatedText('|Agumentality|'),
                            FlickerAnimatedText('|Agumentality|'),
                            FlickerAnimatedText('|Agumentality|'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 400,
                            autoPlay: true,
                            //enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(() => activeindex = index);
                            },
                            pageSnapping: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale),
                        itemCount: HomeDatalst.length,
                        itemBuilder: (context, index, rindex) => Stack(
                          children: <Widget>[
                            const SizedBox(
                              height: 100,
                            ),
                            // Container(
                            //   color: Colors.deepPurpleAccent,
                            //   height: MediaQuery.of(context).size.height,
                            //   width: MediaQuery.of(context).size.width,
                            // ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isBlur = !_isBlur;
                                  });
                                },
                                child: GlassMorphism(
                                  blur: _isBlur ? 20 : 0,
                                  opacity: 0.2,
                                  index: index,
                                ),
                              ),
                            ),
                            Positioned(
                              left: HomeDatalst[index].marginright,
                              top: HomeDatalst[index].margintop,
                              child: Image.asset(
                                HomeDatalst[index].image,
                                width: HomeDatalst[index].width,
                                height: HomeDatalst[index].height,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BuildIndicator(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white70,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MEGACREATERPAGE(),
                    ),
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.userAstronaut,
                  size: 36,
                  color: Color(0xffA687EA),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
