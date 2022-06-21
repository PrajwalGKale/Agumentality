import 'package:agumentality/Class_package/Enum.dart';
import 'package:agumentality/Class_package/SPECSLST.dart';
import 'package:agumentality/SpecsKart/SpecsDetailPageEach.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecsDetailPage extends StatefulWidget {
  @override
  State<SpecsDetailPage> createState() => _SpecsDetailPageState();
}

class _SpecsDetailPageState extends State<SpecsDetailPage> {
  //const SpecsDetailPage({Key? key}) : super(key: key);
  Widget BuildCard({required int index}) {
    return Container(
      height: 50,
      width: 50,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: GridTile(
          footer: Center(
            child: ListTile(
              title: Container(
                child: Text(
                  "${SPecslst[index].name}\n${SPecslst[index].price}\n${SPecslst[index].Framew}\n${SPecslst[index].FrameS}",
                  style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xE2329C92),
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
          ),
          child: Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: Image.asset(SPECS[index])),
        ),
      ),
    );
  }

  Widget buildGridView() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 5,
          itemBuilder: (context, int indx) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpecsDetailEach(index: indx),
                ),
              );
            },
            child: BuildCard(index: indx),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232D2A),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Card(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  'assets/SKart.gif',
                  //fit: BoxFit.contain,
                ),
              ),
            ),
            buildGridView(),
          ],
        ),
      ),
    );
  }
}
