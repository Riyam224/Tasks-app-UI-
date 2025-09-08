import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // logo
  static final TextStyle logo = GoogleFonts.pacifico(
    fontSize: 30,
    fontWeight: FontWeight.w400, // Regular
    color: Colors.black,
  );
  // Titles
  static final TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w400, // Regular
    color: Colors.black,
    letterSpacing: 2,
  );

  static final TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 14.6,
    fontWeight: FontWeight.w700, // Bold
    color: Colors.black,
  );

  static final TextStyle titleSmall = GoogleFonts.inter(
    fontSize: 12.1,
    fontWeight: FontWeight.w400, // Regular
    color: Colors.black,
  );

  // Body Text
  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 11.9,
    fontWeight: FontWeight.w400, // Regular
    color: Colors.black,
  );

  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w300, // Light
    color: Colors.black87,
  );

  static final TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 9.5,
    fontWeight: FontWeight.w400, // Regular
    color: Colors.black87,
  );

  // Labels / Captions
  static final TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 9.8,
    fontWeight: FontWeight.w300, // Light
    color: Colors.black54,
  );

  static final TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 8.8,
    fontWeight: FontWeight.w600, // SemiBold
    color: Colors.black54,
  );

  static final TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 8,
    fontWeight: FontWeight.w400, // Regular
    color: Colors.black45,
  );

  // Tiny Text (hints, sublabels)
  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 7.4,
    fontWeight: FontWeight.w300, // Light
    color: Colors.black45,
  );
}
