// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:notes/core/styling/colors.dart';

// class AppTheme {
//   // 🌞 Light Theme
//   static ThemeData light = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: AppColors.primary,
//     scaffoldBackgroundColor: AppColors.background,
//     cardColor: AppColors.cardBackground,
//     dividerColor: AppColors.divider,

//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColors.primary,
//       foregroundColor: AppColors.textOnPrimary,
//       elevation: 0,
//       titleTextStyle: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.textOnPrimary,
//       ),
//       iconTheme: const IconThemeData(color: AppColors.textOnPrimary),
//     ),

//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: AppColors.primary,
//       foregroundColor: AppColors.textOnPrimary,
//     ),

//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: AppColors.bottomNavBackground,
//       selectedItemColor: AppColors.textOnPrimary,
//       unselectedItemColor: AppColors.textSecondary,
//       selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
//       unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w400),
//     ),

//     textTheme: TextTheme(
//       titleLarge: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.textPrimary,
//       ),
//       bodyLarge: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textPrimary,
//       ),
//       bodyMedium: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textSecondary,
//       ),
//       labelSmall: GoogleFonts.inter(
//         fontSize: 10,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textSecondary,
//       ),
//     ),
//   );

//   // 🌙 Dark Theme
//   static ThemeData dark = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: AppColors.primary,
//     scaffoldBackgroundColor: const Color(0xFF121212),
//     cardColor: const Color(0xFF1E1E1E),
//     dividerColor: Colors.grey[800],

//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColors.primary,
//       foregroundColor: AppColors.textOnPrimary,
//       elevation: 0,
//       titleTextStyle: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.textOnPrimary,
//       ),
//       iconTheme: const IconThemeData(color: AppColors.textOnPrimary),
//     ),

//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: AppColors.primary,
//       foregroundColor: AppColors.textOnPrimary,
//     ),

//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: const Color(0xFF1E1E1E),
//       selectedItemColor: AppColors.primary,
//       unselectedItemColor: AppColors.textSecondary,
//       selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
//       unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w400),
//     ),

//     textTheme: TextTheme(
//       titleLarge: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.textOnPrimary,
//       ),
//       bodyLarge: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textOnPrimary,
//       ),
//       bodyMedium: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textSecondary,
//       ),
//       labelSmall: GoogleFonts.inter(
//         fontSize: 10,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textSecondary,
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/core/styling/colors.dart';

// class AppTheme {
//   // 🌞 Light Theme
//   static ThemeData light = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: AppColors.primary,
//     scaffoldBackgroundColor: AppColors.background,
//     cardColor: AppColors.cardBackground,
//     dividerColor: AppColors.divider,

//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColors.primary,
//       foregroundColor: AppColors.textOnPrimary,
//       elevation: 0,
//       titleTextStyle: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.textOnPrimary,
//       ),
//       iconTheme: const IconThemeData(color: AppColors.textOnPrimary),
//     ),

//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: AppColors.primary,
//       foregroundColor: AppColors.textOnPrimary,
//     ),

//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: AppColors.bottomNavBackground,
//       selectedItemColor: AppColors.textOnPrimary,
//       unselectedItemColor: AppColors.textSecondary,
//       selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
//       unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w400),
//     ),

//     textTheme: TextTheme(
//       titleLarge: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.textPrimary,
//       ),
//       bodyLarge: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textPrimary,
//       ),
//       bodyMedium: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textSecondary,
//       ),
//       labelSmall: GoogleFonts.inter(
//         fontSize: 10,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textSecondary,
//       ),
//     ),

//     // ✅ Input fields
//     inputDecorationTheme: InputDecorationTheme(
//       hintStyle: GoogleFonts.inter(color: AppColors.textSecondary),
//       labelStyle: GoogleFonts.inter(color: AppColors.textPrimary),
//       filled: true,
//       fillColor: Colors.white, // soft white pastel input
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide.none,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.primary, width: 2),
//       ),
//     ),
//   );

//   // 🌙 Dark Theme
//   static ThemeData dark = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: AppColors.primary,
//     scaffoldBackgroundColor: const Color(0xFF121212),
//     cardColor: const Color(0xFF1E1E1E),
//     dividerColor: Colors.grey[800],

//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColors.primary,
//       foregroundColor: AppColors.textOnPrimary,
//       elevation: 0,
//       titleTextStyle: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.textOnPrimary,
//       ),
//       iconTheme: const IconThemeData(color: AppColors.textOnPrimary),
//     ),

//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: AppColors.primary,
//       foregroundColor: AppColors.textOnPrimary,
//     ),

//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: const Color(0xFF1E1E1E),
//       selectedItemColor: AppColors.primary,
//       unselectedItemColor: AppColors.textSecondary,
//       selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
//       unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w400),
//     ),

//     textTheme: TextTheme(
//       titleLarge: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.textOnPrimary,
//       ),
//       bodyLarge: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textOnPrimary,
//       ),
//       bodyMedium: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textSecondary,
//       ),
//       labelSmall: GoogleFonts.inter(
//         fontSize: 10,
//         fontWeight: FontWeight.w400,
//         color: AppColors.textSecondary,
//       ),
//     ),

//     // ✅ Input fields dark mode
//     inputDecorationTheme: InputDecorationTheme(
//       hintStyle: GoogleFonts.inter(color: Colors.grey[400]),
//       labelStyle: GoogleFonts.inter(color: Colors.white),
//       filled: true,
//       fillColor: const Color(0xFF2C2C2C), // soft card dark
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide.none,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.primary, width: 2),
//       ),
//     ),
//   );
// }

class AppTheme {
  // 🌞 Light Theme
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.cardBackground,
    dividerColor: AppColors.divider,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
      ),
      iconTheme: const IconThemeData(color: AppColors.textOnPrimary),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.inputBackground, // ✅ same as input field
      foregroundColor: AppColors.textOnPrimary,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardBackground,
      selectedItemColor: AppColors.textOnPrimary,
      unselectedItemColor: AppColors.textSecondary,
      selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w400),
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
    ),

    // ✅ Input fields
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.inter(color: AppColors.textSecondary),
      labelStyle: GoogleFonts.inter(color: AppColors.textPrimary),
      filled: true,
      fillColor: AppColors.inputBackground, // ✅ uses shared color
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
  );

  // 🌙 Dark Theme
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardColor: const Color(0xFF1E1E1E),
    dividerColor: Colors.grey[800],

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
      ),
      iconTheme: const IconThemeData(color: AppColors.textOnPrimary),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.inputBackground, // ✅ same as input field
      foregroundColor: AppColors.textOnPrimary,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFF1E1E1E),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w400),
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textOnPrimary,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
    ),

    // ✅ Input fields dark mode
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.inter(color: Colors.grey[400]),
      labelStyle: GoogleFonts.inter(color: Colors.white),
      filled: true,
      fillColor: AppColors.inputBackground, // ✅ uses shared color
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
  );
}
