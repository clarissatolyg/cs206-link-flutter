import 'package:flutter/material.dart';
import 'package:link/core/utils/size_utils.dart';
import 'package:link/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get bodyLargeSourceSansPro => theme.textTheme.bodyLarge!.sourceSansPro;
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
      );
  // Display text style
  static get displayMediumGreatVibes =>
      theme.textTheme.displayMedium!.greatVibes.copyWith(
        fontSize: 50.fSize,
      );
  static get displayMediumGreatVibes_1 =>
      theme.textTheme.displayMedium!.greatVibes;
  static get displayMediumPacificoBlack900 =>
      theme.textTheme.displayMedium!.pacifico.copyWith(
        color: appTheme.black900,
      );
  static get displayMediumffcb9cfc => theme.textTheme.displayMedium!.copyWith(
        color: Color(0XFFCB9CFC),
        fontWeight: FontWeight.w700,
      );
  // Great text style
  static get greatVibesBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w400,
      ).greatVibes;
  // Headline text style
  static get headlineLargeff000000 => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFF000000),
        fontSize: 30.fSize,
        fontWeight: FontWeight.w400,
      );
  static get headlineLargeff00000030 => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFF000000),
        fontSize: 30.fSize,
      );
  static get headlineSmallAbhayaLibreMediumWhiteA700 =>
      theme.textTheme.headlineSmall!.abhayaLibreMedium.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallBreeSerifBlack900 =>
      theme.textTheme.headlineSmall!.breeSerif.copyWith(
        color: appTheme.black900,
      );
  static get headlineSmallBreeSerifDeeppurpleA100 =>
      theme.textTheme.headlineSmall!.breeSerif.copyWith(
        color: appTheme.deepPurpleA100,
      );
  static get headlineSmallffcb9cfc => theme.textTheme.headlineSmall!.copyWith(
        color: Color(0XFFCB9CFC),
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallffffffff => theme.textTheme.headlineSmall!.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 25.fSize,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallffffffffSemiBold =>
      theme.textTheme.headlineSmall!.copyWith(
        color: Color(0XFFFFFFFF),
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
      );
  static get titleLargeGray900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeGreatVibesff070f26 =>
      theme.textTheme.titleLarge!.greatVibes.copyWith(
        color: Color(0XFF070F26),
        fontWeight: FontWeight.w400,
      );
  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumSourceSansPro =>
      theme.textTheme.titleMedium!.sourceSansPro.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSourceSansProBlack900 =>
      theme.textTheme.titleMedium!.sourceSansPro.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSourceSansProGray50 =>
      theme.textTheme.titleMedium!.sourceSansPro.copyWith(
        color: appTheme.gray50,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumSourceSansProWhiteA700 =>
      theme.textTheme.titleMedium!.sourceSansPro.copyWith(
        color: appTheme.whiteA700,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSourceSansProWhiteA700Bold =>
      theme.textTheme.titleMedium!.sourceSansPro.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumSourceSansProWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.sourceSansPro.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSourceSansProffffffff =>
      theme.textTheme.titleMedium!.sourceSansPro.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSourceSansProffffffffSemiBold =>
      theme.textTheme.titleMedium!.sourceSansPro.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.42),
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 14.fSize,
      );
}

extension on TextStyle {
  TextStyle get breeSerif {
    return copyWith(
      fontFamily: 'Bree Serif',
    );
  }

  TextStyle get greatVibes {
    return copyWith(
      fontFamily: 'Great Vibes',
    );
  }

  TextStyle get mulish {
    return copyWith(
      fontFamily: 'Mulish',
    );
  }

  TextStyle get pacifico {
    return copyWith(
      fontFamily: 'Pacifico',
    );
  }

  TextStyle get sourceSansPro {
    return copyWith(
      fontFamily: 'Source Sans Pro',
    );
  }

  TextStyle get abhayaLibreMedium {
    return copyWith(
      fontFamily: 'Abhaya Libre Medium',
    );
  }
}
