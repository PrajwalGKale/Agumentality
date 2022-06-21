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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Spec\'s Kart',
          style: GoogleFonts.pacifico(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 400,
                autoPlay: true,
                //enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() => activeindex = index);
                },
                pageSnapping: false,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale),
            itemCount: SKBanner.length,
            itemBuilder: (context, index, rindex) => Container(
              height: 500,
              width: 500,
              child: Image.asset(SKBanner[index]),
            ),
          ),
        ],
      ),
    );
  }
}
