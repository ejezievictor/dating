import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF8B88EF);
  static const Color secondaryColor = Color(0xFFB5B2FF);
  static const Color backgroundColor = Color(0xFF0F1115);
  static const Color cardColor = Color(0xFF232A2E);
  static const Color textPrimaryColor = Colors.white;
  static const Color textSecondaryColor = Color(0xFFCBC9FF);
  
  static TextStyle get headingStyle => const TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
        height: 1.2,
      );
  
  static TextStyle get subtitleStyle => const TextStyle(
        fontFamily: 'Proxima Nova',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: textSecondaryColor,
        height: 1.2,
        letterSpacing: 0,
      );
  
  static TextStyle get bodyStyle => const TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
        height: 1.2,
      );
  
  static TextStyle get bodyBoldStyle => const TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
        height: 1.2,
      );
  
  static TextStyle get labelStyle => const TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      );
  
  static TextStyle get smallTextStyle => const TextStyle(
        fontFamily: 'Proxima Nova',
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );
  
  static TextStyle get helperTextStyle => TextStyle(
        fontFamily: 'Proxima Nova',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor.withOpacity(0.9),
      );
  
  // Button Styles
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: textPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        shadowColor: primaryColor.withOpacity(0.3),
      );
  
  // Decoration Styles
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D000000),
            offset: Offset(2, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      );
  
  static BoxDecoration get selectedCardDecoration => BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor,
          width: 2,
        ),
        boxShadow: [
          const BoxShadow(
            color: Color(0x4D000000),
            offset: Offset(2, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      );
      
  static BoxDecoration get circleAvatarDecoration => BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: textPrimaryColor, width: 2),
      );
  
  // Main Theme Data
  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: backgroundColor,
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textPrimaryColor,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: backgroundColor,
          selectedItemColor: primaryColor,
          unselectedItemColor: textPrimaryColor.withOpacity(0.6),
        ),
      );
}