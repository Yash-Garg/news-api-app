import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color funkyRed = Color(0xFFF54748);
const Color mildWhite = Color(0xFF858585);

final ThemeData appTheme = ThemeData(
  primaryColor: funkyRed,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  fontFamily: GoogleFonts.rubik().fontFamily,
);
