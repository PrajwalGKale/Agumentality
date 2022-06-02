import 'dart:io';
import 'dart:typed_data';
import 'package:agumentality/Class_package/Enum.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class GeometricPattern extends StatefulWidget {
  //const GeometricPattern({Key? key}) : super(key: key);
  final String Shape;
  late int pattern;
  double dragsize;
  double dragRadius;

  GeometricPattern(
      {required this.pattern,
      required this.Shape,
      this.dragsize = 0.0,
      this.dragRadius = 0.0});

  @override
  State<GeometricPattern> createState() => _GeometricPatternState();
}

class _GeometricPatternState extends State<GeometricPattern> {
  late ArCoreController _controller;

  Future _addSphere(ArCoreController controller) async {
    final ByteData texturebytes =
        await rootBundle.load("assets/Pattern/Pattern${widget.pattern}.jpg");

    final materials = ArCoreMaterial(
      color: Colors.amber,
      textureBytes: texturebytes.buffer.asUint8List(),
    );

    final Sphere = ArCoreSphere(
      materials: [materials],
      radius: widget.dragRadius,
    );

    final node = ArCoreNode(
      //scale: vector.Vector3(0, 0, -1.5),
      shape: Sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  Future _addCylinder(ArCoreController controller) async {
    final ByteData texturebytes =
        await rootBundle.load("assets/Pattern/Pattern${widget.pattern}.jpg");

    final materials = ArCoreMaterial(
      //metallic: 0.1,
      //reflectance: 0.1,
      //roughness: 0.1,
      color: Colors.amber,
      textureBytes: texturebytes.buffer.asUint8List(),
    );

    final Cylinder = ArCoreCylinder(
      materials: [materials],
      height: widget.dragsize,
      radius: widget.dragRadius,
    );

    final node = ArCoreNode(
      //scale: vector.Vector3(0, 0, -1.5),
      shape: Cylinder,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  Future _addCube(ArCoreController controller) async {
    final ByteData texturebytes =
        await rootBundle.load("assets/Pattern/Pattern${widget.pattern}.jpg");

    final materials = ArCoreMaterial(
      metallic: 0.1,
      reflectance: 0.1,
      roughness: 0.1,
      //color: Colors.amber,
      textureBytes: texturebytes.buffer.asUint8List(),
    );

    final Cube = ArCoreCube(
      materials: [materials],
      size: vector.Vector3(
          widget.dragRadius, widget.dragRadius, widget.dragRadius),
    );

    final node = ArCoreNode(
      //scale: vector.Vector3(0, 0, -1.5),
      shape: Cube,
      position: vector.Vector3(0, 0, -1.5),
      //rotation:vector.Vector4.zero()
    );
    controller.addArCoreNode(node);
  }

  void onArCoreViewCreated(ArCoreController _arCoreController) {
    _controller = _arCoreController;
    if (widget.Shape == "sphere") {
      _addSphere(_controller);
    } else if (widget.Shape == "cylinder") {
      _addCylinder(_controller);
    } else {
      _addCube(_controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("assets/Pattern/${widget.SavedImage}+.jpg");
    // print("-------");
    // print("-------:):)");
    // print(itemsvalue[items.indexOf(widget.pattern)].toString());
    // print("-------:):)");
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ArCoreView(onArCoreViewCreated: onArCoreViewCreated),
          Positioned(
            top: 50,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const FaIcon(
                FontAwesomeIcons.chevronCircleLeft,
                color: Color(0xf21B094E),
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
