import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {

  /// extra Small size
  static TextStyle extraSmall({Color? color, Color? decorationColor,FontWeight fontWeight = FontWeight.normal,TextDecoration textDecoration = TextDecoration.none, double letterSpacing = 0.0}) {
    return GoogleFonts.outfit(
      decorationColor: decorationColor,
letterSpacing: letterSpacing,
      decoration: textDecoration,
      fontSize: 12.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Small size
  static TextStyle small({Color? color, Color? decorationColor,FontWeight fontWeight = FontWeight.normal,TextDecoration textDecoration = TextDecoration.none, double letterSpacing = 0.0}) {
    return GoogleFonts.outfit(
      decorationColor: decorationColor,
      letterSpacing: letterSpacing,

      decoration: textDecoration,
      fontSize: 15.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Medium size
  static TextStyle medium({Color? color, Color? decorationColor, FontWeight fontWeight = FontWeight.normal, TextDecoration textDecoration = TextDecoration.none, double letterSpacing = 0.0}) {
    return GoogleFonts.outfit(
      letterSpacing: letterSpacing,
      decorationColor: decorationColor,
      decoration: textDecoration,
      fontSize: 18.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Large size
  static TextStyle large({Color? color, Color? decorationColor,FontWeight fontWeight = FontWeight.bold,TextDecoration textDecoration = TextDecoration.none, double letterSpacing = 0.0}) {
    return GoogleFonts.outfit(
      decorationColor: decorationColor,
      decoration: textDecoration,
      letterSpacing: letterSpacing,

      fontSize: 22.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Extra Large size
  static TextStyle extraLarge({Color? color,Color? decorationColor, FontWeight fontWeight = FontWeight.bold,TextDecoration textDecoration = TextDecoration.none,double letterSpacing = 0.0}) {
    return GoogleFonts.outfit(
      decorationColor: decorationColor,
      decoration: textDecoration,
      letterSpacing: letterSpacing,

      fontSize: 25.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Huge
  static TextStyle huge({Color? color, Color? decorationColor,FontWeight fontWeight = FontWeight.bold,TextDecoration textDecoration = TextDecoration.none,double letterSpacing = 0.0}) {
    return GoogleFonts.outfit(
      decorationColor: decorationColor,
      decoration: textDecoration,
      letterSpacing: letterSpacing,

      fontSize: 30.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Huge
  static TextStyle extraHugeText({Color? color, Color? decorationColor,FontWeight fontWeight = FontWeight.bold,TextDecoration textDecoration = TextDecoration.none,double letterSpacing = 0.0}) {
    return GoogleFonts.outfit(
      decorationColor: decorationColor,
      decoration: textDecoration,
      letterSpacing: letterSpacing,

      fontSize: 40.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

}
