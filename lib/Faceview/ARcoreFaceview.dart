import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ARcoreFaceview extends StatefulWidget {
  //const ARcoreFaceview({Key? key}) : super(key: key);

  final int index;
  ARcoreFaceview({required this.index});

  @override
  State<ARcoreFaceview> createState() => _ARcoreFaceviewState();
}

class _ARcoreFaceviewState extends State<ARcoreFaceview> {
  late ArCoreFaceController arCoreFaceController;
  var _forceRedraw;

  @override
  void initState() {
    // TODO: implement initState
    _forceRedraw = Object();
    super.initState();
  }

  void Arcoreviewcreated(ArCoreFaceController controller) {
    arCoreFaceController = controller;

    loadMesh();
  }

  void loadMesh() async {
    final ByteData texturebytes =
        await rootBundle.load("assets/snap${widget.index}.png");
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: Container(
      //   margin: const EdgeInsets.only(bottom: 20),
      //   child: StatefulBuilder(
      //     builder: (context, setState) => FloatingActionButton(
      //         // isExtended: true,
      //         child: const FaIcon(FontAwesomeIcons.cat),
      //         backgroundColor: const Color(0xff645087),
      //         onPressed: () {
      //           setState(() {
      //             index++;
      //             print("_______\nclicked\n_____");
      //           });
      //           _incrementCounter();
      //         }),
      //   ),
      // ),
      body: Stack(
        children: [
          ArCoreFaceView(
            onArCoreViewCreated: Arcoreviewcreated,
            enableAugmentedFaces: true,
            //debug: true,
          ),
        ],
      ),
    );
  }
}
