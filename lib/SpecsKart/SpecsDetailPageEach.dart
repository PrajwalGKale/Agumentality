import 'package:agumentality/Class_package/Enum.dart';
import 'package:agumentality/SpecsKart/SpecRender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Class_package/SPECSLST.dart';

class SpecsDetailEach extends StatelessWidget {
  //const SpecsDetailEach({Key? key}) : super(key: key);
  final int index;
  SpecsDetailEach({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff232D2A),
        title: Text(SPecslst[index].name),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff232D2A),
            ),
            child: Image.asset(SPECS[index + 1]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 200),
            decoration: const BoxDecoration(
              color: Color(0xff232D2A),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 58,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          SPecslst[index].name,
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white60),
                        ),
                        subtitle: Text(
                          SPecslst[index].subname,
                          style: GoogleFonts.roadRage(
                              fontSize: 23,
                              fontStyle: FontStyle.italic,
                              //fontWeight: FontWeight.w500,
                              color: Colors.white60),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpecRender(index: index + 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xE2329C92),
                        elevation: 5,
                      ),
                      child: Row(
                        children: const <Widget>[
                          Text("TRY 3D"),
                          SizedBox(
                            width: 8,
                          ),
                          FaIcon(
                            FontAwesomeIcons.arrowRight,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      SPecslst[index].price,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Color(0xE2329C92),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Rating :',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white60),
                    ),
                    for (int i = 0; i < SPecslst[index].rating; i++)
                      const FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.amber,
                      ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Scrollbar(
                    child: Card(
                      color: Colors.black12,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          SPecslst[index].des,
                          style: GoogleFonts.nunito(
                              fontSize: 14, color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: 95,
          //   left: 10,
          //   child: Container(
          //     height: 160,
          //     width: 150,
          //     decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(20),
          //       ),
          //       color: Color(0xFF624F8A),
          //       border: Border.all(
          //           width: 3, style: BorderStyle.solid, color: Colors.white60),
          //     ),
          //     child: FittedBox(
          //       child: Image.asset(funitureDatalst[index].image,
          //           fit: BoxFit.contain),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
