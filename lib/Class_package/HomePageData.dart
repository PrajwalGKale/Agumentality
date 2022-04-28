import 'package:agumentality/FurnitureMod/FurnitureModule.dart';
import 'package:agumentality/GeoMetricShapes/GeometricShapes.dart';
import 'package:agumentality/MarvelChar.dart';
import 'package:agumentality/Utils/ComingSoon.dart';

class HomepageData {
  final String name;
  final String image;
  final String path;
  final double height;
  final double width;
  final double margintop;
  final double marginright;
  HomepageData(
      {required this.name,
      required this.margintop,
      required this.marginright,
      required this.height,
      required this.width,
      required this.image,
      required this.path});
}

List<HomepageData> HomeDatalst = [
  HomepageData(
      name: "GeoMetric Shape",
      image: "assets/geometry.png",
      path: GeometricShapes.routename,
      width: 220.0,
      height: 240.0,
      margintop: 1.0,
      marginright: 130.0),
  HomepageData(
      name: "Marvel",
      image: "assets/marvel2.png",
      path: ComingSoon.routename,
      width: 270,
      height: 270,
      margintop: 1.0,
      marginright: 100.0),
  HomepageData(
      name: "Furniture",
      image: "assets/ChairOne.png",
      path: FurnitureMod.routename,
      width: 160.0,
      height: 160.0,
      margintop: 40.0,
      marginright: 140.0)
];
