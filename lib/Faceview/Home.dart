import 'package:agumentality/Faceview/ARcoreFaceview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);
  static const routename = '/Faceview';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
            // isExtended: true,
            child: const FaIcon(FontAwesomeIcons.cat),
            backgroundColor: const Color(0xff645087),
            onPressed: () {
              setState(() {
                index != 6 ? index++ : index = 1;
                print("_______\nclicked\n_____");
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ARcoreFaceview(
                          index: index,
                        )),
              );
            }),
      ),
      body: Center(
        child: Container(
          height: 130,
          width: 130,
          decoration: const BoxDecoration(
              color: Color(0xff645087),
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: index == 0
                  ? Text(
                      "Tap",
                      style: GoogleFonts.poppins(
                          fontSize: 50, color: Colors.white70),
                    )
                  : Text(
                      "Filter Number\n            ${index}",
                      style: GoogleFonts.poppins(
                          fontSize: 50, color: Colors.white70),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
