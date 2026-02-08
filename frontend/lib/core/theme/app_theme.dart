import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color midnightBlue = Color(0xFF1A1F36);
  static const Color midnightBlueDark = Color(0xFF101426);
  static const Color midnightBlueLight =
      Color(0xFF2E3552); // Lighter shade for cards
  static const Color accentTeal = Color(0xFF00D1C1);
  static const Color accentViolet = Color(0xFF8A4FFF);
  static const Color offWhite = Color(0xFFF5F7FA);
  static const Color textGrey = Color(0xFFA0AEC0);
  static const Color errorRed = Color(0xFFFF4B4B);
  static const Color primaryOrange = Color(0xFFFF9F1C);

  // Text Styles
  static final TextStyle _headingStyle = GoogleFonts.outfit(
    fontWeight: FontWeight.bold,
    color: offWhite,
  );

  static final TextStyle _bodyStyle = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    color: offWhite,
  );

  // Theme Data
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: midnightBlueDark,
      primaryColor: midnightBlue,
      colorScheme: const ColorScheme.dark(
        primary: accentTeal,
        secondary: accentViolet,
        surface: midnightBlue,
        error: errorRed,
        onPrimary: midnightBlueDark,
        onSecondary: offWhite,
        onSurface: offWhite,
        onError: offWhite,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: midnightBlueDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: _headingStyle.copyWith(
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: offWhite),
      ),
      cardTheme: CardThemeData(
        color: midnightBlue, // Slightly lighter than background
        elevation: 0, // Flat design
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: midnightBlueLight.withValues(alpha: 0.5)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentTeal,
          foregroundColor: midnightBlueDark,
          textStyle: _bodyStyle.copyWith(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: midnightBlue,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accentTeal, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorRed, width: 1),
        ),
        hintStyle: _bodyStyle.copyWith(color: textGrey),
        labelStyle: _bodyStyle.copyWith(color: textGrey),
      ),
      textTheme: TextTheme(
        displayLarge: _headingStyle.copyWith(fontSize: 32),
        displayMedium: _headingStyle.copyWith(fontSize: 28),
        displaySmall: _headingStyle.copyWith(fontSize: 24),
        headlineMedium: _headingStyle.copyWith(fontSize: 20),
        bodyLarge: _bodyStyle.copyWith(fontSize: 16),
        bodyMedium: _bodyStyle.copyWith(fontSize: 14),
        bodySmall: _bodyStyle.copyWith(fontSize: 12, color: textGrey),
      ),
    );
  }
}
