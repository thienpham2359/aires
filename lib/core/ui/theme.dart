import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF5D78FF);
const secondaryColor = Color(0xFF1B2031);
const spaceCadetColor = Color(0xFF282f49);

ThemeData light() {
  return ThemeData.light().copyWith(
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}