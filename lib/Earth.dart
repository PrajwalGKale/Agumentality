import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/services.dart';

class Earth extends StatefulWidget {
  static const routename = '/earth';
  const Earth({Key? key}) : super(key: key);

  @override
  _EarthState createState() => _EarthState();
}

class _EarthState extends State<Earth> {
  late ArCoreController _arCoreController;

  //Earth//
  Future _addEarth(ArCoreController _arCoreController) async {
    final ByteData textture = await rootBundle.load("assets/earth.jpg");

    final material = ArCoreMaterial(
      textureBytes: textture.buffer.asUint8List(),
      color: Color.fromARGB(120, 66, 134, 244),
    );

    final sphere = ArCoreSphere(materials: [material], radius: 0.4);

    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1),
    );

    _arCoreController.addArCoreNode(node);
  }
  //Earth//

  _onArCoreViewCreated(ArCoreController _controller) {
    _arCoreController = _controller;

    _addEarth(_arCoreController);
  }

  Widget _ARCoreGeometricShapes() {
    return ArCoreView(
      onArCoreViewCreated: _onArCoreViewCreated,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: _ARCoreGeometricShapes()),
    );
    ;
  }
}
