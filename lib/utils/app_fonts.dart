import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/constant/font_weight.dart';

class AppFonts {
  /// 30 - extraBold
  static TextStyle headline1({
    Color? color,
    FontWeight fontWeight = extraBold,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 30,
      fontWeight: fontWeight,
    );
  }

  /// 28 - bold
  static TextStyle headline2({
    Color? color,
    FontWeight fontWeight = bold,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 28,
      fontWeight: fontWeight,
    );
  }

  /// 24 - bold
  static TextStyle headline3({
    Color? color,
    FontWeight fontWeight = bold,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 24,
      fontWeight: fontWeight,
    );
  }

  /// 24 - bold
  static TextStyle titleLarge({
    Color? color,
    FontWeight fontWeight = bold,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 24,
      fontWeight: fontWeight,
    );
  }

  /// 17 - bold
  static TextStyle titleMedium({
    Color? color,
    FontWeight fontWeight = bold,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 17,
      fontWeight: fontWeight,
    );
  }

  /// 16 - semiBold
  static TextStyle bodyLarge({
    Color? color,
    FontWeight fontWeight = semiBold,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 16,
      fontWeight: fontWeight,
    );
  }

  /// 14 - semiBold
  static TextStyle bodyMedium({
    Color? color,
    FontWeight fontWeight = semiBold,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 14,
      fontWeight: fontWeight,
    );
  }

  /// 12 - medium
  static TextStyle bodySmall({
    Color? color,
    FontWeight fontWeight = medium,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 12,
      fontWeight: fontWeight,
    );
  }

  /// 10 - medium
  static TextStyle bodyXS({
    Color? color,
    FontWeight fontWeight = medium,
  }) {
    return _baseTextStyle(
      color: color,
      fontSize: 10,
      fontWeight: fontWeight,
    );
  }

  static TextStyle _baseTextStyle({
    Color? color = AppColors.blue50,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.kiwiMaru(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
