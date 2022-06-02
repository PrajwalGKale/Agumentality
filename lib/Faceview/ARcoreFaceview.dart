import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ARcoreFaceview extends StatefulWidget {
  const ARcoreFaceview({Key? key}) : super(key: key);

  @override
  State<ARcoreFaceview> createState() => _ARcoreFaceviewState();
}

class _ARcoreFaceviewState extends State<ARcoreFaceview> {
  late ArCoreFaceController arCoreFaceController;
  int index = 1;
  void Arcoreviewcreated(ArCoreFaceController controller) {
    arCoreFaceController = controller;

    loadMesh();
  }

  void loadMesh() async {
    final ByteData texturebytes =
        await rootBundle.load("assets/snap$index.png");
    arCoreFaceController.loadMesh(
        textureBytes: texturebytes.buffer.asUint8List(),
        skin3DModelFilename: "man_face.sfb");
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
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: FaIcon(FontAwesomeIcons.angry),
        backgroundColor: const Color(0xff645087),
        onPressed: () {
          setState(() {
            index != 6 ? index++ : index = 0;
          });
        },
      ),
      body: ArCoreFaceView(
        onArCoreViewCreated: Arcoreviewcreated,
        enableAugmentedFaces: true,
        //debug: true,
      ),
    );
  }
}
