import 'package:agumentality/Class_package/Enum.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpescKart extends StatefulWidget {
  const SpescKart({Key? key}) : super(key: key);

  @override
  State<SpescKart> createState() => _SpescKartState();
}

class _SpescKartState extends State<SpescKart> {
  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff232D2A),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff203243),
          title: Text(
            'Spec\'s Kart',
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  //enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() => activeindex = index);
                  },
                  pageSnapping: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  //enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale),
              itemCount: SKBanner.length,
              itemBuilder: (context, index, rindex) => Card(
                color: Colors.greenAccent.shade100,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30)),
                    //height: 10,
                    width: 800,
                    child: Image.asset(
                      SKBanner[index],
                      //height: 10,
                      width: 800,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
