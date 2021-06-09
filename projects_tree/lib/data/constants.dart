import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle normalText(
        {double fontSize = 16.0,
        FontWeight fontWeight = FontWeight.w300,
        double letterSpacing = -0.9,
        double height = 0}) =>
    GoogleFonts.notoSans(fontSize: fontSize, fontWeight: fontWeight, letterSpacing: letterSpacing, height: height);
