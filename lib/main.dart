import 'package:agumentality/Experiment.dart';
import 'package:agumentality/Faceview/ARcoreFaceview.dart';
import 'package:agumentality/FurnitureMod/FurnitureModule.dart';
import 'package:agumentality/GeoMetricShapes/GeometricShapes.dart';
import 'package:agumentality/HomePage.dart';
import 'package:agumentality/OnBoarding.dart';
import 'package:agumentality/Utils/ComingSoon.dart';
import 'package:flutter/material.dart';
import 'Earth.dart';
import 'OnTap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeometricShapes(),
      routes: {
        GeometricShapes.routename: (ctx) => GeometricShapes(),
        Earth.routename: (ctx) => Earth(),
        ComingSoon.routename: (ctx) => ComingSoon(),
        FurnitureMod.routename: (ctx) => FurnitureMod(),
        Experiment.routename: (ctx) => Experiment(),
        OnTap.routename: (ctx) => OnTap(),
        //BottomSheetGEO.routename: (ctx) => BottomSheetGEO(),
      },
    );
  }
}
