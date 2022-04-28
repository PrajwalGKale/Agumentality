import 'package:agumentality/FurnitureMod/FunitureData.dart';
import 'package:agumentality/FurnitureMod/FurnitureRender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureDetailPage extends StatelessWidget {
  //const FurnitureDetailPage({Key? key}) : super(key: key);
  final int index;

  FurnitureDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF624F8A),
        title: Text(funitureDatalst[index].name),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                //stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Color(0xFFD6C7F7),
                  Color(0xFF956BF0),
                  Color(0xFF624F8A),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 200),
            decoration: const BoxDecoration(
              color: Colors.black54,
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
                          funitureDatalst[index].name,
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white60),
                        ),
                        subtitle: Text(
                          funitureDatalst[index].subtitle,
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
                            builder: (context) =>
                                FurnitureRenderMod(index: index + 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple.shade200,
                        elevation: 5,
                      ),
                      child: Row(
                        children: const <Widget>[
                          Text("Create"),
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
                    Text(funitureDatalst[index].price),
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Rating :'),
                    for (int i = 0; i < funitureDatalst[index].star; i++)
                      const FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.amber,
                      ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Scrollbar(
                    child: Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            funitureDatalst[index].description,
                            style: GoogleFonts.nunito(
                                fontSize: 14, color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 95,
            left: 10,
            child: Container(
              height: 160,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xFF624F8A),
                border: Border.all(
                    width: 3, style: BorderStyle.solid, color: Colors.white60),
              ),
              child: FittedBox(
                child: Image.asset(funitureDatalst[index].image,
                    fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
