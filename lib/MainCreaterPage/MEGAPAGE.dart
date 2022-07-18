import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:hover_effect/hover_effect.dart';
import 'package:url_launcher/url_launcher.dart';

class MEGACREATERPAGE extends StatefulWidget {
  const MEGACREATERPAGE({Key? key}) : super(key: key);

  @override
  State<MEGACREATERPAGE> createState() => _MEGACREATERPAGEState();
}

class _MEGACREATERPAGEState extends State<MEGACREATERPAGE>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  var hover1 = false;
  var hover2 = false;

  //Animation Var//
  List<Color> colorList = [
    const Color(0xff3022AC),
    const Color(0xff8236A3),
    Color(0xff110E33),
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
  late Animation avatarcolor1;
  late Animation avatarcolor2;

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

    avatarcolor1 =
        ColorTween(begin: Colors.deepPurple, end: Colors.indigoAccent[100])
            .animate(controller);
    avatarcolor2 =
        ColorTween(begin: Colors.indigoAccent[100], end: Colors.deepPurple)
            .animate(controller);

    controller.forward();

    avatarcolor1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //controller.reverse(from: 1.0);
        setState(() {
          controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          controller.forward();
        });
      }
    });

    avatarcolor2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //controller.reverse(from: 1.0);
        setState(() {
          controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          controller.forward();
        });
      }
    });

    animationcolor.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //controller.reverse(from: 1.0);
        setState(() {
          bottomColor = Color(0xff7A74BE);
        });
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
        setState(() {
          bottomColor = Color(0xff242142);
        });
      }
    });
  }

  //Animation Fun//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Container(
                child: Image.asset("assets/TechBack.gif"),
                margin: const EdgeInsets.only(bottom: 390),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 180),
              height: 500,
              width: 600,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: HoverCard(
                  builder: (context, hovering) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: ListTile(
                            title: Text('HOLA 👋,\nPrajwal Kale',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.pacifico(
                                    fontSize: 23,
                                    // fontWeight: FontWeight.w700,
                                    color: Colors.blueGrey)),
                            trailing: IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.volumeUp,
                                color: Colors.deepPurpleAccent,
                              ),
                              onPressed: () {},
                            ),
                            subtitle: Text('👨‍💻Inventor/Developer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.turretRoad(
                                    fontSize: 16,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: Divider(
                            thickness: 1.2,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialHandleBtn(
                                url:
                                    'https://www.linkedin.com/in/the-prajwal-kale/',
                                IconData: FontAwesomeIcons.linkedin),
                            const SizedBox(
                              width: 12,
                            ),
                            SocialHandleBtn(
                                url: 'https://github.com/PrajwalGKale',
                                IconData: FontAwesomeIcons.github),
                            const SizedBox(
                              width: 12,
                            ),
                            SocialHandleBtn(
                                url:
                                    'https://www.linkedin.com/in/the-prajwal-kale/',
                                IconData: FontAwesomeIcons.twitter),
                            const SizedBox(
                              width: 12,
                            ),
                            SocialHandleBtn(
                                url:
                                    'https://www.linkedin.com/in/the-prajwal-kale/',
                                IconData: FontAwesomeIcons.instagram),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 0.0),
                          child: Divider(
                            thickness: 1.2,
                            color: Colors.deepPurple,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Keen Interest : ',
                            style: GoogleFonts.turretRoad(fontSize: 16),
                          ),
                          subtitle: Text('Flutter / ML Enthusiast',
                              style: GoogleFonts.poppins(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpandableText(
                            'I\'m Currently pursuing B.Tech from Dr. Babasaheb Ambedkar Technological University, I have experience in Flutter Development and Machine Learning and I\'m looking for a challenging environmentwhere I can grow with the organization and enhance my skills and abilities.',
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                            expandText: 'more About Me!',
                            collapseText: 'less About Me!',
                            expandOnTextTap: true,
                            collapseOnTextTap: true,
                            maxLines: 2,
                            linkColor: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  depth: 22,
                  depthColor: const Color(0xff8E6DC7),
                  onTap: () {
                    setState(() {
                      hover1 = !hover1;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: avatarcolor1.value,
                  radius: 90,
                  child: CircleAvatar(
                    backgroundColor: avatarcolor2.value,
                    radius: 84,
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/Prajwal_Kale.png'), //NetworkImage
                      radius: 78,
                    ), //CircleAvatar
                  ), //CircleAvatar
                ), //CircleAvatar
              ),
            ),
          ],
        ),
      ),
    );
  }

  SocialHandleBtn({required IconData IconData, required String url}) => InkWell(
        onTap: () async {
          await launch(url);
        },
        child: CircleAvatar(
          radius: 25,
          foregroundColor: Colors.deepPurpleAccent,
          child: Center(
            child: Icon(
              IconData,
              size: 32,
            ),
          ),
        ),
      );
}
