import 'dart:ui';
import 'package:agumentality/Class_package/HomePageData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final int index;
  const GlassMorphism(
      {required this.blur, required this.opacity, required this.index});

  @override
  Widget build(BuildContext context) {
    print(HomeDatalst[index].path);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              print(HomeDatalst[index].path);
              Navigator.of(context).pushNamed(HomeDatalst[index].path);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(opacity),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: Container(
                height: 159,
                width: 510,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        HomeDatalst[index].name,
                        style: GoogleFonts.oswald(
                            color: Colors.white.withOpacity(0.9), fontSize: 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
