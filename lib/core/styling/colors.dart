import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color background = Color(0xFFFDEEEE);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color bottomNavBackground = Color(0xFFE99CA1);

  static const Color meethingBar = Color(0xFFBE7676);

  // Primary
  static const Color primary = Color(0xFFE99CA1);
  static const Color primaryLight = Color(0xFFFDEEEE);

  // Task Categories
  static const meeting = Color(0xFFBD7675);
  static const study = Color(0xFF8D4FB1);
  static const travelling = Color(0xFFD9A628);

  static const meetingCard = Color(0xFFF7C3C1);
  static const studyCard = Color(0xFFC78CF2);
  static const travellingCard = Color(0xFFF8D272);

  // Text
  static const Color textPrimary = Color(0xFF2D2D2D);
  static const Color textSecondary = Color(0xFF6E6E6E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  /// ✅ Always-dark text color for tasks (works in light + dark theme)
  static const Color taskText = Color(0xFF1E1E1E);

  // Dividers / Shadows
  static const Color divider = Color(0xFFE1E1E1);
  static const Color shadow = Color(0x33000000); // 20% opacity black

  // Inputs
  static const Color inputBackground = Color.fromARGB(255, 223, 182, 134);
}
