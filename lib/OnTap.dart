import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class OnTap extends StatefulWidget {
  static const routename = '/anchor';

  const OnTap({Key? key}) : super(key: key);

  @override
  _OnTapState createState() => _OnTapState();
}

class _OnTapState extends State<OnTap> {
  late ArCoreController _arCoreController;

  Future _addSphere(ArCoreHitTestResult hit) async {
    final moonMaterial = ArCoreMaterial(color: Colors.grey);
    final moonShape = ArCoreSphere(
      materials: [moonMaterial],
      radius: 0.03,
    );

    final moon = ArCoreNode(
        shape: moonShape,
        position: vector.Vector3(0, 0, -1),
        rotation: vector.Vector4(0, 0, 0, 0));

    //earth//
    final ByteData textture = await rootBundle.load("assets/earth.jpg");
    final material = ArCoreMaterial(
      textureBytes: textture.buffer.asUint8List(),
      color: Color.fromARGB(120, 66, 134, 244),
    );

    final earth = ArCoreSphere(materials: [material], radius: 0.1);

    final earthnode = ArCoreNode(
        shape: earth,
        children: [moon],
        position: vector.Vector3(0, 0, -1),
        rotation: hit.pose.rotation);
    _arCoreController.addArCoreNodeWithAnchor(earthnode);
  }

  void _handelOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addSphere(hit);
  }

  void OnTapHandel(String name) {
    print("Flutter : OnNodeTap");
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: Text('OnNodeTap on $name'),
            ));
  }

  void onArCoreViewCreated(ArCoreController controller) {
    _arCoreController = controller;
    _arCoreController.onNodeTap = (name) => OnTapHandel(name);
    _arCoreController.onPlaneTap = _handelOnPlaneTap;
  }

  @override
  void dispose() {
    _arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ArCoreView(
          onArCoreViewCreated: onArCoreViewCreated,
          enableTapRecognizer: true,
          enablePlaneRenderer: true,
        ),
      ),
    );
  }
}
