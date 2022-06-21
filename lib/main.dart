import 'package:agumentality/Experiment.dart';
import 'package:agumentality/Faceview/ARcoreFaceview.dart';
import 'package:agumentality/Faceview/Home.dart';
import 'package:agumentality/FurnitureMod/FurnitureModule.dart';
import 'package:agumentality/GeoMetricShapes/GeometricShapes.dart';
import 'package:agumentality/HomePage.dart';
import 'package:agumentality/Marvel/Marvel.dart';
import 'package:agumentality/Marvel/MarvelRender.dart';
import 'package:agumentality/OnBoarding.dart';
import 'package:agumentality/SpecsKart/SpecsKart.dart';
import 'package:agumentality/Utils/ComingSoon.dart';
import 'package:flutter/material.dart';
import 'Earth.dart';
import 'OnTap.dart';
import 'SpecsKart/SpecsDetailPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpecsDetailPage(),
      routes: {
        GeometricShapes.routename: (ctx) => GeometricShapes(),
        Earth.routename: (ctx) => Earth(),
        Marvel.routename: (ctx) => Marvel(),
        FurnitureMod.routename: (ctx) => FurnitureMod(),
        Experiment.routename: (ctx) => Experiment(),
        OnTap.routename: (ctx) => OnTap(),
        Home.routename: (ctx) => Home(),
        //ARcoreFaceview.routename: (ctx) => ARcoreFaceview()
        //BottomSheetGEO.routename: (ctx) => BottomSheetGEO(),
      },
    );
  }
}
