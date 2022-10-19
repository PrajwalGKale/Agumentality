import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:native_screenshot/native_screenshot.dart';
import 'dart:convert';
import 'package:share_plus/share_plus.dart';

class ARcoreFaceview extends StatefulWidget {
  //const ARcoreFaceview({Key? key}) : super(key: key);

  final int index;

  ARcoreFaceview({required this.index});

  @override
  State<ARcoreFaceview> createState() => _ARcoreFaceviewState();
}

class _ARcoreFaceviewState extends State<ARcoreFaceview> {
  late ArCoreFaceController arCoreFaceController;
  final controller = ScreenshotController();
  final picker = ImagePicker();
  TextEditingController _name = TextEditingController();

  void getImagefile(ImageSource source, BuildContext ctx) async {
    PickedFile? Image = await picker.getImage(source: source);
    if (Image == null) {
      return null;
    }
    // var croppedFile = await ImageCropper().cropImage(
    //   sourcePath: Image.path,
    //   maxHeight: 512,
    //   maxWidth: 512,
    //   aspectRatioPresets: [
    //     CropAspectRatioPreset.square,
    //     CropAspectRatioPreset.original,
    //   ],
    //   androidUiSettings: const AndroidUiSettings(
    //       toolbarTitle: 'Cropper',
    //       toolbarColor: Color(0xFF624F8A),
    //       toolbarWidgetColor: Colors.white70,
    //       backgroundColor: Color(0xFF624F8A),
    //       initAspectRatio: CropAspectRatioPreset.original,
    //       lockAspectRatio: false),
    //   iosUiSettings: const IOSUiSettings(
    //     minimumAspectRatio: 1.0,
    //   ),
    // );
    // print("-------\n");
    // print(croppedFile.runtimeType);
    // print("-------\n");
    await Share.shareFiles([Image.path]);
  }

  Future<String> savedImage(String image) async {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         backgroundColor: const Color(0xFFD6C7F7),
    //         shape: const RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(32.0))),
    //         contentPadding: const EdgeInsets.only(top: 10.0),
    //         content: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               width: 800.0,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: TextFormField(
    //                   keyboardType: TextInputType.name,
    //                   controller: _name,
    //                   validator: MultiValidator(
    //                       [RequiredValidator(errorText: '*Required')]),
    //                   decoration: InputDecoration(
    //                     prefixIcon: const FaIcon(
    //                       FontAwesomeIcons.idBadge,
    //                       color: Colors.deepPurple,
    //                       size: 20,
    //                     ),
    //                     labelText: 'Snap Name',
    //                     labelStyle: TextStyle(color: Colors.deepPurpleAccent),
    //                     // labelStyle: TextStyle(color: Colors.deepOrange),
    //                     hintText: '@snap',
    //                     enabledBorder: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(20),
    //                       borderSide:
    //                           BorderSide(color: Colors.black54, width: 2.0),
    //                     ),
    //                     focusedBorder: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(20),
    //                       borderSide:
    //                           BorderSide(color: Colors.redAccent, width: 2.0),
    //                     ),
    //                     border: OutlineInputBorder(
    //                       borderSide:
    //                           BorderSide(color: Colors.black54, width: 5.0),
    //                       borderRadius: BorderRadius.circular(20),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             IconButton(
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //                 icon: FaIcon(
    //                   FontAwesomeIcons.angleDoubleRight,
    //                   color: Colors.deepPurpleAccent,
    //                   size: 30,
    //                 )),
    //           ],
    //         ),
    //       );
    //     });
    Fluttertoast.showToast(
        msg: "Snap Clicked.(wait for data save)",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepPurpleAccent.shade200,
        textColor: Color(0xFF1B2421),
        fontSize: 16.0);
    Fluttertoast.showToast(
        msg: "Snap Saved Successfully.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepPurpleAccent.shade200,
        textColor: Color(0xFF1B2421),
        fontSize: 16.0);

    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll(".", "-")
        .replaceAll(":", "-");
    //final nameid = _name.text + "_";
    //final date = time.toString();
    final name = "Agumentality_$time";
    print("------------");
    print(name);
    print("------------");
    Uint8List _bytesImage;
    _bytesImage = Base64Decoder().convert(image);
    final result = await ImageGallerySaver.saveImage(_bytesImage, name: name);
    return result['filePath'];
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

  Widget buildImage() => Stack(
        children: [
          ArCoreFaceView(
            onArCoreViewCreated: Arcoreviewcreated,
            enableAugmentedFaces: true,
            //debug: true,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 300),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(9)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Agumentality@-PrajwalKale",
                  style: GoogleFonts.pressStart2p(
                      fontSize: 10,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      );
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arCoreFaceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controller,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
              // isExtended: true,
              child:
                  const FaIcon(FontAwesomeIcons.camera, color: Colors.white70),
              backgroundColor: const Color(0xff645087),
              onPressed: () async {
                final image = await NativeScreenshot.takeScreenshot();
                if (image == null) return;
                await savedImage(image);
              }),
        ),
        body: Stack(
          children: [
            ArCoreFaceView(
              onArCoreViewCreated: Arcoreviewcreated,
              enableAugmentedFaces: true,
              //debug: true,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 200),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(9)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Agumentality@-PrajwalKale",
                    style: GoogleFonts.pressStart2p(
                        fontSize: 10,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 57,
                width: 57,
                margin: const EdgeInsets.only(top: 670, left: 150),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xff645087),
                ),
                child: IconButton(
                  onPressed: () {
                    getImagefile(ImageSource.gallery, context);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.shareAlt,
                    color: Colors.white70,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
