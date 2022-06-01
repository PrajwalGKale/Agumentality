import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'FunitureData.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class FurnitureRenderMod extends StatefulWidget {
  final int index;
  //const FurnitureRenderMod({Key? key}) : super(key: key);
  FurnitureRenderMod({required this.index});

  @override
  State<FurnitureRenderMod> createState() => _FurnitureRenderModState();
}

class _FurnitureRenderModState extends State<FurnitureRenderMod> {
  late ArCoreController arCoreController;
  var posheight = 800;
  var poswidth = 800;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arCoreController.dispose();
  }

  void ArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = controlOnPalneTap;
  }

  void controlOnPalneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    addSofa(hit);
  }

  Future addSofa(ArCoreHitTestResult hit) async {
    final bytes =
        (await rootBundle.load("assets/Furniture/Sofa${widget.index}.png"))
            .buffer
            .asUint8List();
    final characterpos = ArCoreNode(
      image: ArCoreImage(
        bytes: bytes,
        width: poswidth,
        height: widget.index > 5 ? 900 : posheight,
      ),
      position: hit.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation: hit.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );
    arCoreController.addArCoreNodeWithAnchor(characterpos);
  }

  @override
  Widget build(BuildContext context) {
    print("-------\n${widget.index}\n---------");
    return Scaffold(
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: ArCoreViewCreated,
            enableTapRecognizer: true,
          ),
          Positioned(
            top: 130,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    print("plus");
                    setState(() {
                      posheight = posheight + 100;
                      poswidth = poswidth + 80;
                    });
                    print("----------\n-------");
                    print(poswidth);
                    print(posheight);
                    print("----------\n-------");
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.plusCircle,
                    color: Color(0xff645087),
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                IconButton(
                  onPressed: () {
                    print("plus");
                    setState(() {
                      posheight = posheight - 100;
                      poswidth = poswidth - 80;
                    });
                    print("----------\n-------");
                    print(poswidth);
                    print(posheight);
                    print("----------\n-------");
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.minusCircle,
                    color: Color(0xff645087),
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const FaIcon(
                FontAwesomeIcons.chevronCircleLeft,
                color: Color(0xff754EB0),
                size: 40,
              ),
            ),
          ),
          // Positioned(
          //   top: 80,
          //   left: 10,
          //   child: FittedBox(
          //     child: FlutterSlider(
          //       values: [300],
          //       max: 500,
          //       min: 0,
          //       onDragging: (handlerIndex, lowerValue, upperValue) {
          //         _height = lowerValue;
          //         _width = upperValue;
          //         setState(() {});
          //       },
          //     ),
          //   ),
          // ),
          Positioned(
            top: 50,
            right: 10,
            child: SpeedDial(
              tooltip: "Contact",
              elevation: 10,
              backgroundColor: const Color(0xff754EB0),
              activeBackgroundColor: const Color(0xFF624F8A),
              overlayColor: Colors.deepPurpleAccent,
              overlayOpacity: 0.4,
              animatedIcon: AnimatedIcons.menu_close,
              spacing: 13,
              direction: SpeedDialDirection.left,
              buttonSize: const Size(50.0, 50.0),
              //openCloseDial: ,
              shape: const StadiumBorder(),
              spaceBetweenChildren: 12,
              children: [
                SpeedDialChild(
                  child: const Icon(FontAwesomeIcons.at),
                  label: 'Mail',
                  onTap: () async {
                    print("clicked @");
                    String email = 'ikeadummy@gmail.com';
                    String subject = 'want this chair';
                    String body = 'like';
                    int num = widget.index;
                    // final ByteData bytes = await rootBundle
                    //     .load('assets/images/${widget.imgUrl}.png');
                    // final Uint8List list = bytes.buffer.asUint8List();
                    // final directory = (await getExternalStorageDirectory()).path;
                    // File imgFile = File('$directory/screenshot.png');
                    // imgFile.writeAsBytesSync(list);

                    final ByteData bytes = await rootBundle
                        .load(funitureDatalst[widget.index - 1].image);
                    final Uint8List list = bytes.buffer.asUint8List();
                    final directory =
                        (await getExternalStorageDirectory())?.path;
                    File imgFile = File('$directory/Sofa${num}.png');
                    imgFile.writeAsBytesSync(list);
                    // Share.shareFiles(
                    //   ['$directory/Sofa1.png'],
                    //   text:
                    //       'Hello There,\n\nThis are deatils about your product with photo.\n\n(please check the your product details,then share to this mail Id: IKeaDummyMail@gmail.com)\n\n\t\tName : ${funitureDatalst[widget.index].name}\n\n\t\tPrice : ${funitureDatalst[widget.index].price}',
                    //   subject:
                    //       'This Mail Regarding To Inform You I Want This Product.',
                    // );
                    const GMAIL_SCHEMA = 'com.google.android.gm';

                    final bool gmailinstalled =
                        await FlutterMailer.isAppInstalled(GMAIL_SCHEMA);

                    if (gmailinstalled) {
                      final MailOptions mailOptions = MailOptions(
                        body:
                            "Hello There 👋,<br><br>This are deatils about your product with photo.<br><br>\t\tName : ${funitureDatalst[widget.index].name}🛋️<br>\t\tPrice : ${funitureDatalst[widget.index].price}💰<br>Des : ${funitureDatalst[widget.index].description}ℹ️<br><br><hr>(please check the your product details,then share this mail)<br><br>Thanks for choosing us ❤️<br>Happy To Serve You 😊",
                        subject:
                            "This Mail Regarding To Inform You I Want This Product.🪑🚚",
                        recipients: ['customercare.india@ikea.com'],
                        isHTML: true,
                        bccRecipients: ['IKeaDummyMail@gmail.com'],
                        ccRecipients: ['IKeaDummyMail@gmail.com'],
                        attachments: ['$directory/Sofa${num}.png'],
                        appSchema: GMAIL_SCHEMA,
                      );
                      await FlutterMailer.send(mailOptions);
                    }
                  },
                ),
                SpeedDialChild(
                    child: const Icon(FontAwesomeIcons.phone),
                    label: 'Contact',
                    onTap: () {
                      launch("tel://+91 1800 419 4532");
                    }),
              ],
            ),
          ),
          // Positioned(
          //   top: 50,
          //   right: 10,
          //   child: IconButton(
          //     onPressed: () async {
          //       print("clicked @");
          //       String email = 'ikeadummy@gmail.com';
          //       String subject = 'want this chair';
          //       String body = 'like';
          //
          //       // final ByteData bytes = await rootBundle
          //       //     .load('assets/images/${widget.imgUrl}.png');
          //       // final Uint8List list = bytes.buffer.asUint8List();
          //       // final directory = (await getExternalStorageDirectory()).path;
          //       // File imgFile = File('$directory/screenshot.png');
          //       // imgFile.writeAsBytesSync(list);
          //
          //       final ByteData bytes =
          //           await rootBundle.load(funitureDatalst[widget.index].image);
          //       final Uint8List list = bytes.buffer.asUint8List();
          //       final directory = (await getExternalStorageDirectory())?.path;
          //       File imgFile = File('$directory/Sofa1.png');
          //       imgFile.writeAsBytesSync(list);
          //       Share.shareFiles(
          //         ['$directory/Sofa1.png'],
          //         text:
          //             'Hello There,\n\nThis are deatils about your product with photo.\n\n(please check the your product details,then share to this mail Id: IKeaDummyMail@gmail.com)\n\n\t\tName : ${funitureDatalst[widget.index].name}\n\n\t\tPrice : ${funitureDatalst[widget.index].price}',
          //         subject:
          //             'This Mail Regarding To Inform You I Want This Product.',
          //       );
          //       // const GMAIL_SCHEMA = 'com.google.android.gm';
          //       //
          //       // final bool gmailinstalled =
          //       //     await FlutterMailer.isAppInstalled(GMAIL_SCHEMA);
          //       //
          //       // if (gmailinstalled) {
          //       //   final MailOptions mailOptions = MailOptions(
          //       //     body:
          //       //         'a long body for the email <br> with a subset of HTML',
          //       //     subject: 'the Email Subject',
          //       //     recipients: ['example@example.com'],
          //       //     isHTML: true,
          //       //     bccRecipients: ['other@example.com'],
          //       //     ccRecipients: ['third@example.com'],
          //       //     attachments: ['$directory/Sofa1.png'],
          //       //     appSchema: GMAIL_SCHEMA,
          //       //   );
          //       //   await FlutterMailer.send(mailOptions);
          //       // }
          //     },
          //     icon: const FaIcon(
          //       FontAwesomeIcons.at,
          //       color: Color(0xff754EB0),
          //       size: 40,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
