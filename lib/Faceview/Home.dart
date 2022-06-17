import 'package:agumentality/Faceview/ARcoreFaceview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);
  static const routename = '/Faceview';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  int indexfilter = 1;
  late int activeindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7E66A7),
      body: Center(
        child: Swiper(
          layout: SwiperLayout.TINDER,
          itemHeight: 300,
          itemWidth: 300,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                  color: Color(0xff6841AB),
                  borderRadius: BorderRadius.circular(24)),
              child: Image.asset(
                "assets/Filters/Filter${index + 1}.png",
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: 8,
          //fade: 100.0,
          pagination: SwiperPagination(),
          control: SwiperControl(),
          onTap: (index) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ARcoreFaceview(index: index + 1)),
            );
          },
        ),
      ),
    );
  }
}
