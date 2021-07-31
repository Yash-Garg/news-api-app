import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color accentColor = Color(0xFF6B21FF);
const Color mildWhite = Color(0xFF858585);

final ThemeData appTheme = ThemeData(
  primaryColor: accentColor,
  brightness: Brightness.dark,
  cardTheme: CardTheme(color: Color(0xFF212121)),
  scaffoldBackgroundColor: Color(0xFF141414),
  fontFamily: GoogleFonts.rubik().fontFamily,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  }),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
);
