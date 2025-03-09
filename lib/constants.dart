import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// App colors
class AppColors {
  static const Color primaryColor = Color(0xFF9C27B0); 
  static const Color secondaryColor = Color(0xFF0D0D1F); 
  static const Color accentColor = Color(0xFF3A3A5A); 
  static const Color textColor = Colors.white;
  static const Color textColorBlack = Colors.black;
  static const Color subtitleColor = Color(0xFFAAAAAA);
}

// Text styles
class AppTextStyles {
  static TextStyle heading = GoogleFonts.poppins(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle subheading = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.subtitleColor,
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

static TextStyle buttonTextBlack = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textColorBlack,
  );
  static TextStyle navItem = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );
}

// Button styles
class AppButtonStyles {
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.textColor,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle primaryButtonWhite = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.textColorBlack,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}