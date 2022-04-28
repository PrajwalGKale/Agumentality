import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:path_provider/path_provider.dart';

class GeoMetricColor extends StatefulWidget {
  final Color color;
  final String Shape;
  double dragSize;
  double dragRadius;
  GeoMetricColor(
      {required this.color,
      required this.Shape,
      this.dragRadius = 0.0,
      this.dragSize = 0.0});

  @override
  State<GeoMetricColor> createState() => _GeoMetricColorState();
}

class _GeoMetricColorState extends State<GeoMetricColor> {
  late ArCoreController _controller;

  Future _addSphere(ArCoreController controller) async {
    final materials = ArCoreMaterial(
      color: widget.color,
      //textureBytes: TextureByte.buffer.asUint8List(),
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
    final materials =
        ArCoreMaterial(color: widget.color, metallic: 0.1, roughness: 0.1
            //textureBytes: TextureByte.buffer.asUint8List(),
            );

    final Cylinder = ArCoreCylinder(
      materials: [materials],
      height: widget.dragSize,
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
    final materials = ArCoreMaterial(color: widget.color, metallic: 1.0
        //textureBytes: TextureByte.buffer.asUint8List(),
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
