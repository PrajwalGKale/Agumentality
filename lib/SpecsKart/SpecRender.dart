import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpecRender extends StatefulWidget {
  final int index;
  SpecRender({required this.index});

  @override
  State<SpecRender> createState() => _SpecRenderState();
}

class _SpecRenderState extends State<SpecRender> {
  late ArCoreFaceController arCoreFaceController;

  void loadMesh() async {
    final ByteData texturebytes =
        await rootBundle.load("assets/snap${widget.index}.png");
    arCoreFaceController.loadMesh(
        textureBytes: texturebytes.buffer.asUint8List(),
        skin3DModelFilename: "man_face.sfb");
  }

  void Arcoreviewcreated(ArCoreFaceController controller) {
    arCoreFaceController = controller;
    loadMesh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreFaceView(
        onArCoreViewCreated: Arcoreviewcreated,
        enableAugmentedFaces: true,
        //debug: true,
      ),
    );
  }
}
