import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class MarvelCharacter extends StatefulWidget {
  const MarvelCharacter({Key? key}) : super(key: key);

  @override
  _MarvelCharacterState createState() => _MarvelCharacterState();
}

class _MarvelCharacterState extends State<MarvelCharacter> {
  late ArCoreController _arCoreController;

  Widget Marvelview() {
    return ArCoreView(
      enableTapRecognizer: true,
      onArCoreViewCreated: _onArCoreViewCreated,
    );
  }

  void _onArCoreViewCreated(ArCoreController arcore) async {
    _arCoreController = arcore;
    _arCoreController.onPlaneTap = controlplaneTap;
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
        body: Stack(
          children: <Widget>[
            Marvelview(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Positioned(
                top: 1,
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 40,
                ),
              ),
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  void controlplaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    print("--------");
    print(hit.distance);
    print("--------");

    //adding characters//
    addcharacter(hit);
  }

  Future addcharacter(ArCoreHitTestResult hit) async {
    final bytes =
        (await rootBundle.load("assets/spiderman.png")).buffer.asUint8List();

    final characterPos = ArCoreNode(
      image: ArCoreImage(bytes: bytes, height: 600, width: 500),
      position: hit.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation: hit.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );

    _arCoreController.addArCoreNodeWithAnchor(characterPos);
  }
}
