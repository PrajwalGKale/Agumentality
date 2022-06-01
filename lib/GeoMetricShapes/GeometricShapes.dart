import 'dart:io';
import 'package:agumentality/GeoMetricShapes/GeoMetricColor.dart';
import 'package:agumentality/GeoMetricShapes/GeoMetricCreatedImage.dart';
import 'package:agumentality/GeoMetricShapes/GeometicPattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:agumentality/Class_package/Enum.dart';
import 'package:agumentality/Utils/PatternLst.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:wave_slider/wave_slider.dart';
import 'package:custom_cupertino_picker/custom_cupertino_picker.dart';
//import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

final isDialOpen = ValueNotifier(false);

class GeometricShapes extends StatefulWidget {
  //const GeometricShapes({Key? key}) : super(key: key);
  static const routename = '/Geometric';

  @override
  _GeometricShapesState createState() => _GeometricShapesState();
}

class _GeometricShapesState extends State<GeometricShapes>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late ArCoreController _arCoreController;
  var isClick = false;
  final _Fromkey = GlobalKey<FormState>();
  static const kActiveCardColour = Color(0xFF4C4C72);
  static const kInactiveCardColour = Color(0xff8E6CD8);
  Shapeselection shapeselection = Shapeselection.null1;
  static final _Hexcontroller = TextEditingController();
  final picker = ImagePicker();
  late File ImageFile;

  //UI VAR//
  Color color = Colors.deepPurpleAccent;
  int frist = 0;
  bool call = false;
  late File savedImage;
  bool jugad = false;
  var Shape;
  late Color hexcode;
  var selectedcolor;
  double _dragRadius = 0.1;
  double _dragsize = 0.1;
  Color _color = Colors.blue;
  var SelectedIndex = 0;
  var selectedpattern;
  var indexpat;
  late bool flag = false;
  var selectedValue;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  //UI VAR//

  //Animation Var//
  List<Color> colorList = [
    const Color(0xff3022AC),
    const Color(0xff8236A3),
    Colors.indigo,
    Color(0xffC5B2D7),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = const Color(0xff3022AC);
  Color topColor = const Color(0xff7504CD);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  late AnimationController controller;
  late Animation animationcolor;
  //Animation Var//
  @override
  void initState() {
    super.initState();

    _Hexcontroller.addListener(() {
      setState(() {});
    });

    controller = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
    );
    animationcolor =
        ColorTween(begin: const Color(0xff3022AC), end: const Color(0xff1D1150))
            .animate(controller);
    controller.forward();
    animationcolor.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //controller.reverse(from: 1.0);
        setState(() {
          bottomColor = Colors.blue.shade200;
        });
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
        setState(() {
          bottomColor = Colors.indigoAccent.shade100;
        });
      }
    });
  }

  //MAIN FUNCTION//
  void
      //MAIN FUNCTION//
//Cam FUNCTION//
      getImagefile(ImageSource source, BuildContext ctx) async {
    PickedFile? Image = await picker.getImage(source: source);
    if (Image == null) {
      return null;
    }
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: Image.path,
      maxHeight: 512,
      maxWidth: 512,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
      ],
      androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Color(0xFF624F8A),
          toolbarWidgetColor: Colors.white70,
          backgroundColor: Color(0xFF624F8A),
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: const IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    );
    // Image2 = croppedFile as PickedFile?;
    setState(() async {
      ImageFile = File(croppedFile!.path);
      final appdir = await syspath.getApplicationDocumentsDirectory();
      final filename = path.basename(ImageFile.path);
      savedImage = await File(ImageFile.path).copy('${appdir.path}/$filename');
      setState(() {
        jugad = true;
      });
      print('-----path-----\n');
      print(savedImage.runtimeType);
    });
  }
  //Cam FUNCTION//

  //validation//
//#FF5733
//   void checkValidation() {
//     if (_Fromkey.currentState!.validate()) {
//       setState(() {
//         flag = true;
//         hexcode = hexcode + _Hexcontroller.text;
//         print(hexcode);
//         frist = frist + int.parse(hexcode[0] + hexcode[1]);
//       });
//     } else {
//       setState(() {
//         flag = false;
//       });
//     }
//   }

  // String? Check(value) {
  //   if (value.toString().contains(RegExp(r'#'))) {
  //     return "*Remove Hash ('#')!!!";
  //   } else if (value.toString().length > 6) {
  //     return "{Hexcode <= 6}";
  //   } else if (value.toString().length < 6) {
  //     return "{Hexcode >= 6}";
  //   } else {
  //     return null;
  //   }
  // }

  //choose Color//
  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
      print(pickerColor);
    });
  }

  Widget buildColorPicker() => ColorPicker(
      pickerColor: color,
      displayThumbColor: true,
      paletteType: PaletteType.hsvWithHue,
      onColorChanged: changeColor);

  pickColor(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFD6C7F7),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: Container(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Custom Color",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 4.0,
                ),
                buildColorPicker(),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: const BoxDecoration(
                      color: Color(0xff64368C),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0)),
                    ),
                    child: Text(
                      "Select",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });

  //choose color//
//validation//
  void _BottomSheetGEO(BuildContext context) {
    showModalBottomSheet<void>(
      //isScrollControlled: true,
      elevation: 7,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            height: double.maxFinite,
            color: Colors.black12,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    Container(
                      //height: double.maxFinite,
                      color: const Color(0xbf280D63),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ButtonsTabBar(
                              radius: 12,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              borderWidth: 2,
                              borderColor: const Color(0xff563897),
                              elevation: 3.0,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF330163),
                                    Color(0xFF7504CD),
                                    Color(0xFF9311BF),
                                  ],
                                ),
                              ),
                              unselectedLabelStyle:
                                  const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.white),
                              height: 56,
                              tabs: const [
                                Tab(
                                    icon: FaIcon(FontAwesomeIcons.shapes),
                                    text: "Shape"),
                                Tab(
                                    icon: FaIcon(FontAwesomeIcons.vectorSquare),
                                    text: "Geometry"),
                                Tab(
                                  icon: FaIcon(FontAwesomeIcons.palette),
                                  text: "Color",
                                ),
                                Tab(
                                  icon: FaIcon(FontAwesomeIcons.images),
                                  text: "Format",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                //stops: [0.1, 0.5, 0.7, 0.9],
                                colors: [
                                  Color(0xFFD6C7F7),
                                  Color(0xFF956BF0),
                                  Color(0xFF624F8A),
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Shape = "cube";
                                          shapeselection = Shapeselection.cube;
                                        });
                                        print("------\n${Shape}\n------");
                                      },
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: shapeselection ==
                                                  Shapeselection.cube
                                              ? kActiveCardColour
                                              : kInactiveCardColour,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/Cube.png",
                                            height: 40,
                                            width: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Shape = "cylinder";
                                          shapeselection =
                                              Shapeselection.cylinder;
                                        });
                                        print("------\n${Shape}\n------");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: shapeselection ==
                                                    Shapeselection.cylinder
                                                ? kActiveCardColour
                                                : kInactiveCardColour,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/Cylinder.png",
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          shapeselection =
                                              Shapeselection.sphere;
                                          Shape = "sphere";
                                        });
                                        print("------\n${Shape}\n------");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: shapeselection ==
                                                    Shapeselection.sphere
                                                ? kActiveCardColour
                                                : kInactiveCardColour,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/Sphere.png",
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                //stops: [0.1, 0.5, 0.7, 0.9],
                                colors: [
                                  Color(0xFFD6C7F7),
                                  Color(0xFF956BF0),
                                  Color(0xFF624F8A),
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(14),
                                        ),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Radius",
                                            style: GoogleFonts.pacifico(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: WaveSlider(
                                              displayTrackball: false,
                                              sliderHeight: 70,
                                              color: Colors.black38,
                                              onChanged: (double dragUpdate) {
                                                setState(() {
                                                  _dragRadius = dragUpdate *
                                                      0.6; // dragUpdate is a fractional value between 0 and 1
                                                });
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            _dragRadius.toStringAsPrecision(1),
                                            style: GoogleFonts.permanentMarker(
                                                fontSize: 29,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                //more needed//
                                Shape != "sphere"
                                    ? Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  "height/size",
                                                  style: GoogleFonts.pacifico(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: WaveSlider(
                                                    displayTrackball: false,
                                                    sliderHeight: 70,
                                                    color: Colors.black38,
                                                    onChanged:
                                                        (double dragUpdate) {
                                                      setState(() {
                                                        _dragsize = dragUpdate *
                                                            0.6; // dragUpdate is a fractional value between 0 and 1
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  _dragsize
                                                      .toStringAsPrecision(1),
                                                  style: GoogleFonts
                                                      .permanentMarker(
                                                          fontSize: 29),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 0,
                                        height: 0,
                                      ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                //stops: [0.1, 0.5, 0.7, 0.9],
                                colors: [
                                  Color(0xFFD6C7F7),
                                  Color(0xFF956BF0),
                                  Color(0xFF624F8A),
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 90,
                                  width: 250,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white70,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            //to set border radius to button
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        padding: EdgeInsets.all(20)),
                                    onPressed: () {
                                      pickColor(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const FaIcon(
                                          FontAwesomeIcons.fillDrip,
                                          color: Colors.deepPurple,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Choose Color",
                                          style: GoogleFonts.pacifico(
                                              wordSpacing: 1,
                                              letterSpacing: 2,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 30),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white70,
                                      elevation: 5,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return jugad == true
                                              ? GeoMetricCreated(
                                                  Shape: Shape,
                                                  dragRadius: _dragRadius,
                                                  dragsize: _dragsize,
                                                  SavedImage: savedImage,
                                                )
                                              : GeoMetricColor(
                                                  Shape: Shape,
                                                  color: pickerColor,
                                                  dragRadius: _dragRadius,
                                                  dragSize: _dragsize);
                                        }),
                                      );
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        const FaIcon(
                                          FontAwesomeIcons.chevronRight,
                                          color: Colors.deepPurple,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Create",
                                          style: GoogleFonts.roadRage(
                                              color: Colors.white60,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 40),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                //stops: [0.1, 0.5, 0.7, 0.9],
                                colors: [
                                  Color(0xFFD6C7F7),
                                  Color(0xFF956BF0),
                                  Color(0xFF624F8A),
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: const [
                                          Icon(
                                            Icons.list,
                                            size: 16,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Select Pattern',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white70,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          )
                                        ],
                                      ),
                                      items: items
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedpattern,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedpattern = value as String;
                                          indexpat = patternList
                                              .indexOf(selectedpattern);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                      ),
                                      iconSize: 14,
                                      iconEnabledColor: Colors.white70,
                                      iconDisabledColor: Colors.grey,
                                      buttonHeight: 50,
                                      buttonWidth: 160,
                                      buttonPadding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      buttonDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: Colors.amber.shade300,
                                        ),
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      buttonElevation: 2,
                                      itemHeight: 40,
                                      itemPadding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      dropdownMaxHeight: 200,
                                      dropdownWidth: 200,
                                      dropdownPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 22),
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.black12,
                                      ),
                                      //dropdownElevation: 8,
                                      scrollbarRadius:
                                          const Radius.circular(40),
                                      scrollbarThickness: 6,
                                      scrollbarAlwaysShow: true,
                                      offset: const Offset(-20, 0),
                                    ),
                                  ),
                                  //margin: const EdgeInsets.only(bottom: 30),
                                ),
                                const Spacer(),
                                Flexible(
                                  child: SpeedDial(
                                    elevation: 10,
                                    backgroundColor: Color(0xFFD6C7F7),
                                    activeBackgroundColor: Color(0xFF624F8A),
                                    overlayColor: Colors.deepPurpleAccent,
                                    overlayOpacity: 0.4,
                                    animatedIcon: AnimatedIcons.menu_close,
                                    spacing: 13,
                                    buttonSize: const Size(50.0, 50.0),
                                    label: Text(
                                      "CIM",
                                      style: GoogleFonts.roadRage(fontSize: 20),
                                    ),
                                    //openCloseDial: ,
                                    shape: const StadiumBorder(),
                                    spaceBetweenChildren: 12,
                                    children: [
                                      SpeedDialChild(
                                          child: const Icon(
                                              FontAwesomeIcons.cameraRetro),
                                          label: 'Camera',
                                          onTap: () {
                                            getImagefile(
                                                ImageSource.camera, context);
                                            print('clicked cam'); // WORKS FINE
                                          }),
                                      SpeedDialChild(
                                          child: const Icon(
                                              FontAwesomeIcons.images),
                                          label: 'Gallery',
                                          onTap: () {
                                            getImagefile(
                                                ImageSource.gallery, context);
                                            print(
                                                'clicked1 gallery'); // WORKS FINE
                                          }),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 30),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white70,
                                      elevation: 5,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return jugad == true
                                              ? GeoMetricCreated(
                                                  Shape: Shape,
                                                  dragRadius: _dragRadius,
                                                  dragsize: _dragsize,
                                                  SavedImage: savedImage,
                                                )
                                              : GeometricPattern(
                                                  Shape: Shape,
                                                  dragRadius: _dragRadius,
                                                  dragsize: _dragsize,
                                                  pattern: indexpat,
                                                );
                                        }),
                                      );
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        const FaIcon(
                                          FontAwesomeIcons.chevronRight,
                                          color: Colors.deepPurple,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Create",
                                          style: GoogleFonts.roadRage(
                                              color: Colors.white60,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 40),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 150,
          margin: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
            elevation: 5,
            // isExtended: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 6.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText('Click Here!'),
                  FlickerAnimatedText('Click Here!!'),
                  FlickerAnimatedText("Click Here!!!"),
                ],
                onTap: () => _BottomSheetGEO(context),
              ),
            ),
            backgroundColor: const Color(0xbfcD4B6F9),
            onPressed: () => _BottomSheetGEO(context),
          ),
        ),
        body: Center(
          child: AnimatedContainer(
            child: Image.asset("assets/geometry.png"),
            height: double.maxFinite,
            width: double.maxFinite,
            duration: const Duration(seconds: 1),
            onEnd: () {
              setState(() {
                index = index + 1;
                // animate the color
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];
                //comment below two line//
                begin = alignmentList[index % alignmentList.length];
                end = alignmentList[(index + 2) % alignmentList.length];
              });
            },
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: begin, end: end, colors: [bottomColor, topColor])),
          ),
        ),
      ),
    );
  }
}
