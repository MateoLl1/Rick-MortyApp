

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  
  ThemeData getTheme () => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.greenAccent,
    brightness: Brightness.dark,

    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserratAlternates(
        fontSize: 25,
        fontWeight: FontWeight.w500
      ),

      titleMedium: GoogleFonts.montserratAlternates(
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),



      bodyLarge: GoogleFonts.montserratAlternates(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline
      ),

      labelLarge: GoogleFonts.montserratAlternates(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
        color: Colors.green
      ),
      labelMedium: GoogleFonts.montserratAlternates(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      labelSmall: GoogleFonts.montserratAlternates(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),

      

    )


  );

}