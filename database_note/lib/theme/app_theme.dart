import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme baseText = GoogleFonts.poppinsTextTheme();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,

    //pengaturan warna halaman
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1565C0),
      secondary: Color(0xFF42A5F5),
      surface: Colors.white,
    ),

    //ini untuk warna scaffold mode terang
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),

    //pengatur warna appbar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1565C0),
      foregroundColor: Colors.white,
      elevation: 0,

      //pengatur warna card
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
    ),

    //ini untuk dialog
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
      titleTextStyle: AppTheme.baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      contentTextStyle: AppTheme.baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.black87,
      )
    ),
    //pengaturan font tulisan aplikasi
    textTheme: baseText.copyWith(
      titleLarge: baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      bodyMedium: baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.black87,
      ),
      bodySmall: baseText.bodySmall?.copyWith(fontSize: 12, color: Colors.grey),
    ),
  );

  //============= DARK ============

  static ThemeData dark = ThemeData(
    brightness: Brightness.light,

    //pengaturan warna halaman
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1565C0),
      secondary: Color(0xFF42A5F5),
      surface: Colors.white,
    ),

    //ini untuk warna scaffold mode terang
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),

    //pengatur warna appbar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1565C0),
      foregroundColor: Colors.white,
      elevation: 0,

      //pengatur warna card
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
    ),

    //ini untuk dialog
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
      titleTextStyle: AppTheme.baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      contentTextStyle: AppTheme.baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.black87,
      )
    ),
    //pengaturan font tulisan aplikasi
    textTheme: baseText.copyWith(
      titleLarge: baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      bodyMedium: baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.black87,
      ),
      bodySmall: baseText.bodySmall?.copyWith(fontSize: 12, color: Colors.grey),
    ),
  );
}
