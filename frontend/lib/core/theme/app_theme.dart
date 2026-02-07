import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color midnightBlue = Color(0xFF191970);
  static const Color midnightBlueLight = Color(0xFF2C2C8C);
  static const Color offWhite = Color(0xFFF5F5F7);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color tealAccent = Color(0xFF008080);
  static const Color violetAccent = Color(0xFF8A2BE2);
  static const Color errorRed = Color(0xFFD32F2F);
  static const Color successGreen = Color(0xFF388E3C);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF757575);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: midnightBlue,
      scaffoldBackgroundColor: offWhite,
      colorScheme: const ColorScheme.light(
        primary: midnightBlue,
        secondary: tealAccent,
        tertiary: violetAccent,
        surface: pureWhite,
        error: errorRed,
        onPrimary: pureWhite,
        onSecondary: pureWhite,
        onSurface: textDark,
      ),
      textTheme: GoogleFonts.outfitTextTheme().copyWith(
        displayLarge: GoogleFonts.outfit(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: midnightBlue,
        ),
        displayMedium: GoogleFonts.outfit(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        bodyLarge: GoogleFonts.outfit(fontSize: 16, color: textDark),
        bodyMedium: GoogleFonts.outfit(fontSize: 14, color: textGrey),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: pureWhite,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(
          color: midnightBlue,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: midnightBlue),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: midnightBlue,
          foregroundColor: pureWhite,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: pureWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: midnightBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorRed, width: 1.5),
        ),
      ),
    );
  }
}
