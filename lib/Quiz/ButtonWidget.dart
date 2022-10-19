import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String timer;
  final VoidCallback onClicked;
  final double topr;
  ButtonWidget(
      {required this.timer, required this.onClicked, required this.topr});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Positioned(
        top: topr,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: onClicked,
            child: Text(
              timer,
              style: GoogleFonts.poppins(color: Colors.white),
            )),
      ),
    );
  }
}
