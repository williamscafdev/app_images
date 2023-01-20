import 'package:flutter/material.dart';
import 'package:app_images/core/configs/style/app_colors.dart';
import 'package:app_images/core/configs/style/app_text_styles.dart';

class AppThemes {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: TgyStyle.fontFamily,
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.primary),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.black,
      ),
      backgroundColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.black,
        titleTextStyle: TgyStyle.h6,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.primary),
      textTheme: TextThemes.textTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.white,
        titleTextStyle: TgyStyle.h5,
      ),
    );
  }
}

class TextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      bodyText1: TgyStyle.b1,
      bodyText2: TgyStyle.b2,
      subtitle1: TgyStyle.st1,
      subtitle2: TgyStyle.st2,
      headline1: TgyStyle.h1,
      headline2: TgyStyle.h2,
      headline3: TgyStyle.h3,
      headline4: TgyStyle.h4,
    );
  }

  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyText1: TgyStyle.b1.copyWith(color: AppColors.white),
      bodyText2: TgyStyle.b2.copyWith(color: AppColors.white),
      subtitle1: TgyStyle.st1.copyWith(color: AppColors.white),
      subtitle2: TgyStyle.st2.copyWith(color: AppColors.white),
      headline1: TgyStyle.h1.copyWith(color: AppColors.white),
      headline2: TgyStyle.h2.copyWith(color: AppColors.white),
      headline3: TgyStyle.h3.copyWith(color: AppColors.white),
      headline4: TgyStyle.h4.copyWith(color: AppColors.white),
    );
  }

  static TextTheme get primaryTextTheme {
    return TextTheme(
      bodyText1: TgyStyle.b1.copyWith(color: AppColors.primary),
      bodyText2: TgyStyle.b2.copyWith(color: AppColors.primary),
      subtitle1: TgyStyle.st1.copyWith(color: AppColors.primary),
      subtitle2: TgyStyle.st2.copyWith(color: AppColors.primary),
      headline1: TgyStyle.h1.copyWith(color: AppColors.primary),
      headline2: TgyStyle.h2.copyWith(color: AppColors.primary),
      headline3: TgyStyle.h3.copyWith(color: AppColors.primary),
      headline4: TgyStyle.h4.copyWith(color: AppColors.primary),
    );
  }
}
