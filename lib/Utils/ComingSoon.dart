import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoon extends StatelessWidget {
  static const routename = '/soon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade700,
      body: Center(
        child: Text(
          "WOrking\nCOMING SOON!!!",
          style: GoogleFonts.pacifico(fontSize: 20, color: Colors.white60),
        ),
      ),
    );
  }
}
