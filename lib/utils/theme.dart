import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystery/constant/colors.dart';

class AppTheme {
  ThemeData lightTheme() => _baseTheme(_lightColorScheme);

  ThemeData darkTheme() => _baseTheme(_darkColorScheme);

  static final _darkColorScheme = const ColorScheme.dark().copyWith(
    background: AppColors.demoBlue,
    secondary: const Color(0xFF13B9FF),
  );

  static const _lightColorScheme = ColorScheme.light();

  ThemeData _baseTheme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: 'Inter',
      useMaterial3: false,
      textTheme: GoogleFonts.robotoTextTheme(
        _textTheme(colorScheme),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: white,
      ),
      scaffoldBackgroundColor: AppColors.demoBlue,
      appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom()),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     maximumSize: const Size.fromHeight(46),
      //     textStyle: GoogleFonts.(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(6),
      //     ),
      //   ),
      // ),
    );
  }

  //TODO: implement for dark mode
  TextTheme _textTheme(ColorScheme colorScheme) {
    return const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        // fontWeight: FontWeight.w300,
        fontFamily: 'Inter',
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.bold,
        fontFamily: 'Inter',

        // color: AppColors.bodyMedium,
      ),
      titleMedium: TextStyle(
        fontSize: 15,
        // fontWeight: medium,
        color: white08,
        fontFamily: 'Inter',

        // color: AppColors.shadowColor,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        // fontWeight: FontWeight.w400,
        fontFamily: 'Inter',

        // color: AppColors.labelSmall,
      ),
    );
  }
}
