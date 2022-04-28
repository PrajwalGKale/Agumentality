import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Experiment extends StatefulWidget {
  static const routename = '/measure';
  const Experiment({Key? key}) : super(key: key);

  @override
  _ExperimentState createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  late ArCoreController _arCoreController;
  late ArCorePlane _arCorePlane;
  late ArCoreNode _node;
  late vector.Vector3 lastposition;
  late String anchorid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
