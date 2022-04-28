import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:path_provider/path_provider.dart';
//import 'package:image/image.dart';

class GeoMetricCreated extends StatefulWidget {
  // const GeoMetricCreated({Key? key}) : super(key: key);
  final String Shape;
  late File SavedImage;
  double dragsize;
  double dragRadius;
  GeoMetricCreated(
      {required this.SavedImage,
      required this.Shape,
      this.dragsize = 0.0,
      this.dragRadius = 0.0});

  @override
  State<GeoMetricCreated> createState() => _GeoMetricCreatedState();
}

class _GeoMetricCreatedState extends State<GeoMetricCreated> {
  late ArCoreController _controller;

  Future _addSphere(ArCoreController controller) async {
    Uint8List tempimage = widget.SavedImage.readAsBytesSync();
    final ByteData TextureByte = ByteData.view(tempimage.buffer);
    //await rootBundle.load('assets/${widget.SavedImage}');

    final materials = ArCoreMaterial(
      color: Colors.amber,
      textureBytes: TextureByte.buffer.asUint8List(),
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
    Uint8List tempimage = widget.SavedImage.readAsBytesSync();
    final ByteData TextureByte = ByteData.view(tempimage.buffer);
    //await rootBundle.load('assets/${widget.SavedImage}');

    final materials = ArCoreMaterial(
      //metallic: 0.1,
      //reflectance: 0.1,
      //roughness: 0.1,
      color: Colors.amber,
      textureBytes: TextureByte.buffer.asUint8List(),
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
    Uint8List tempimage = widget.SavedImage.readAsBytesSync();
    final ByteData TextureByte = ByteData.view(tempimage.buffer);
    //await rootBundle.load('assets/${widget.SavedImage}');

    final materials = ArCoreMaterial(
      metallic: 0.1,
      reflectance: 0.1,
      roughness: 0.1,
      color: Colors.amber,
      textureBytes: TextureByte.buffer.asUint8List(),
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.dragRadius);
    print(widget.dragsize);
    print(widget.SavedImage);
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
