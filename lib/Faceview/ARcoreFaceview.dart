import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';

class ARcoreFaceview extends StatefulWidget {
  const ARcoreFaceview({Key? key}) : super(key: key);

  @override
  State<ARcoreFaceview> createState() => _ARcoreFaceviewState();
}

class _ARcoreFaceviewState extends State<ARcoreFaceview> {
  late ArCoreFaceController arCoreFaceController;
  void Arcoreviewcreated(ArCoreFaceController controller) {
    arCoreFaceController = controller;
    loadMesh();
  }

  void loadMesh() async {
    final ByteData texturebytes =
        await rootBundle.load("assets/fox_face_mesh_texture.png");
    arCoreFaceController.loadMesh(
        textureBytes: texturebytes.buffer.asUint8List(),
        skin3DModelFilename: "fox_face.sfb");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arCoreFaceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreFaceView(
        onArCoreViewCreated: Arcoreviewcreated,
        enableAugmentedFaces: true,
      ),
    );
  }
}
