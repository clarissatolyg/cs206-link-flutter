import 'package:flutter/material.dart';
import 'package:link/core/app_export.dart';

class AppDecoration {
  // Background decorations
  static BoxDecoration get background => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Fill decorations
  static BoxDecoration get fillIndigoA => BoxDecoration(
        color: appTheme.indigoA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlueGrayToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.54, -0.14),
          end: Alignment(0.53, 1),
          colors: [
            appTheme.blueGray10000,
            appTheme.gray600,
          ],
        ),
      );
  static BoxDecoration get gradientBlueGrayToGray600 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.54, -0.14),
          end: Alignment(0.53, 1),
          colors: [
            appTheme.blueGray10000,
            appTheme.gray600,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border.all(
          color: appTheme.black900,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineDeepPurpleA => BoxDecoration();
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.whiteA700,
          width: 1.h,
        ),
      );

  // Primary decorations
  static BoxDecoration get primary => BoxDecoration(
        color: appTheme.deepPurpleA100,
      );

  // Transparent decorations
  static BoxDecoration get transparentBackground => BoxDecoration(
        border: Border.all(
          color: appTheme.whiteA700,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL10 => BorderRadius.vertical(
        bottom: Radius.circular(10.h),
      );
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );
  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
        top: Radius.circular(30.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
  static BorderRadius get roundedBorder62 => BorderRadius.circular(
        62.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
