import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;

class TextAR extends StatefulWidget {
  const TextAR({Key? key}) : super(key: key);

  @override
  _TextARState createState() => _TextARState();
}

class _TextARState extends State<TextAR> {
  late ARKitController _arKitController;

  void CreateARView(ARKitController controller) {
    this._arKitController = controller;
    this._arKitController.add(CreateText());
  }

  CreateText() async {
    final txt = ARKitText(
      text: "Hello World",
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(Colors.deepPurpleAccent),
        )
      ],
    );

    return ARKitNode(
      geometry: txt,
      position: vector.Vector3(-0.3, 0.3, -1.4),
      scale: vector.Vector3(0.02, 0.02, 0.02),
    );
  }

  @override
  void dispose() {
    _arKitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ARKitSceneView(
        onARKitViewCreated: CreateARView,
      ),
    ));
  }
}
