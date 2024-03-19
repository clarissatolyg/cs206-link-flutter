import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:link/core/utils/pref_utils.dart';
import 'package:link/core/utils/size_utils.dart';
import 'package:get/get.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.deepPurpleA100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: Color(0XFF070F26),
          fontSize: 16.fSize,
          fontFamily: 'Bree Serif',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 14.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 12.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: Color(0XFF000000),
          fontSize: 40.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 36.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 32.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: Color(0XFF000000),
          fontSize: 24.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: Color(0XFFFFFFFF),
          fontSize: 13.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: Color(0XFFFFFFFF),
          fontSize: 20.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Color(0XFFFFFFFF),
          fontSize: 15.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light();
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray10000 => Color(0X00D9D9D9);

  // DeepPurple
  Color get deepPurpleA100 => Color(0XFFCB9CFC);
  Color get deepPurpleA200 => Color(0XFF7B61FF);

  // Gray
  Color get gray50 => Color(0XFFF8F8F8);
  Color get gray600 => Color(0XFF737373);
  Color get gray900 => Color(0XFF070F26);

  // Indigo
  Color get indigoA700 => Color(0XFF4B39EF);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
