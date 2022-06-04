import 'package:agumentality/Faceview/ARcoreFaceview.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
                index != 8 ? index++ : index = 1;
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
            itemCount: 8,
            itemBuilder: (context, index, rindex) => Card(
              child: Image.asset(),
            ),
          ),
        ),
      ),
    );
  }
}
