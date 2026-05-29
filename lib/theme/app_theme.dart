import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      surface: AppColors.surface,
      primary: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.surfaceAlt,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
      headlineLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w900,
        fontSize: 32,
        color: AppColors.textPrimary,
        letterSpacing: -1,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: AppColors.textPrimary,
        letterSpacing: 1.2,
      ),
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: AppColors.textPrimary,
      ),
      titleMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.textPrimary,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.textPrimary,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: AppColors.textSecondary,
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.textTertiary,
      ),
      labelSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 11,
        color: AppColors.textMuted,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceNav,
      indicatorColor: AppColors.primary.withValues(alpha: 0.2),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColors.surfaceAlt,
      indicatorColor: AppColors.primary.withValues(alpha: 0.2),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.surface,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      shadowColor: AppColors.shadowGreen,
      titleTextStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: AppColors.textPrimary,
        letterSpacing: 1.2,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.borderLight),
        foregroundColor: AppColors.textTertiary,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceCardAlt,
      hintStyle: const TextStyle(color: AppColors.textMuted),
      prefixIconColor: AppColors.primary,
      suffixIconColor: AppColors.primary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.borderSubtle),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.borderPrimary),
      ),
      labelStyle: const TextStyle(color: AppColors.textSecondary),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.borderSubtle,
      thickness: 1,
      space: 1,
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: AppColors.primary,
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textMuted,
      labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 13),
      unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceCardAlt,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceCardAlt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
