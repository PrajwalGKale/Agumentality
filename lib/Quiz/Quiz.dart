import 'dart:async';

import 'package:agumentality/Quiz/ButtonWidget.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'QuizLst.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late ArCoreFaceController arCoreFaceController;
  late String str;
  List<String> list = [];
  static const maxsecond = 10;
  int second = maxsecond;
  static const ssmaxsecond = 3;
  int ttsecond = ssmaxsecond;
  Timer? _timer;
  Timer? _ttimer;
  int index = 0;
  bool status = false;
  void Arcoreviewcreated(ArCoreFaceController controller) {
    arCoreFaceController = controller;
  }

  buildTimer() => Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: second / maxsecond,
            strokeWidth: 8,
            backgroundColor: Colors.greenAccent.shade200,
            valueColor: const AlwaysStoppedAnimation(Colors.white70),
          ),
          Center(
            child: Text(
              "$second",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ],
      );

  buildBtn(
      {required String label,
      required Function function,
      required double top}) {
    return ButtonWidget(
      topr: top,
      timer: label,
      onClicked: () {
        function();
      },
    );
  }

  void resetTimer() => setState(() {
        second = maxsecond;
      });

  void sresetTimer() => setState(() {
        ttsecond = ssmaxsecond;
        status = false;
      });

  void StartT() {
    _ttimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (ttsecond > 0) {
        setState(() {
          ttsecond--;
        });
      } else {
        _ttimer?.cancel();
        starttimer();
        sresetTimer();
      }
    });
  }

  void starttimer() {
    shuffle();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (second > 0) {
        setState(() {
          status = true;
          second--;
        });
      } else {
        stoptimer();
      }
    });
  }

  void stoptimer() {
    _timer?.cancel();
    resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ArCoreFaceView(
            onArCoreViewCreated: Arcoreviewcreated,
            enableAugmentedFaces: true,
            //debug: true,
          ),
          status != false
              ? Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 370),
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color:
                          second != 0 ? Color(0xff9D88F9) : Colors.greenAccent,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            color: second != 0
                                ? Colors.deepPurpleAccent.withOpacity(0.9)
                                : Colors.greenAccent.withOpacity(0.9),
                            offset: Offset(0, 25),
                            blurRadius: 3,
                            spreadRadius: -10)
                      ],
                    ),
                    child: Center(
                        child: second != 0
                            ? Text(
                                "${list.join("")}",
                                style: GoogleFonts.raleway(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 30),
                              )
                            : Text(
                                "${movies[0]}",
                                style: GoogleFonts.raleway(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 30),
                              )),
                  ),
                )
              : Container(
                  child: Positioned(
                    top: 40,
                    left: 170,
                    child: Text(
                      "$ttsecond",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 80,
                          color: Colors.white),
                    ),
                  ),
                ),
          status != false
              ? Positioned(
                  top: 226,
                  left: 160,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60)),
                    child: Center(
                      child: buildTimer(),
                    ),
                  ),
                )
              : Container(),
          buildBtn(label: "Start Timer", function: StartT, top: 10),
          buildBtn(label: "Next", function: () {}, top: 10),
        ],
      ),
    );
  }

  void shuffle() {
    String res = movies[index].toString();
    for (int i = 0; i < res.length; i++) {
      list.add(res[i]);
    }

    print(list[0]);

    list.shuffle();
    print(list);
    print(list.join(""));
  }
}
// void main() {
//
//   String s = "dhamaal";
//
//   List<String> list = [];
//
//   for(int i=0;i<s.length;i++)
//   {
//     list.add(s[i]);
//   }
//
//
//   print(list[0]);
//
//
//   list.shuffle();
//   print(list);
//   print(list.join(""));
// }
