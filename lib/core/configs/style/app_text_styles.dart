import 'package:flutter/material.dart';
import 'package:app_images/core/configs/style/app_colors.dart';

const String font = 'Montserrat';

TextStyle textStyle = const TextStyle(
  fontFamily: font,
  letterSpacing: 0,
  color: AppColors.white,
);

extension BetterStyle on TextStyle {
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get grey100 => copyWith(color: AppColors.grey100);
  TextStyle get grey200 => copyWith(color: AppColors.grey200);
  TextStyle get red100 => copyWith(color: AppColors.red100);
  TextStyle get red200 => copyWith(color: AppColors.red200);
  TextStyle get green100 => copyWith(color: AppColors.green100);
  TextStyle get green200 => copyWith(color: AppColors.green200);
  TextStyle get black100 => copyWith(color: AppColors.black100);
  TextStyle get black200 => copyWith(color: AppColors.black200);
  TextStyle get blue100 => copyWith(color: AppColors.blue100);
  TextStyle get blue200 => copyWith(color: AppColors.blue200);
  TextStyle get secondary => copyWith(color: AppColors.secondary);
  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get ambar100 => copyWith(color: AppColors.ambar100);
  TextStyle get ambar200 => copyWith(color: AppColors.ambar200);
  TextStyle get ambar300 => copyWith(color: AppColors.ambar300);

  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}

abstract class TgyStyle {
  static const String fontFamily = 'Montserrat';
  static TextStyle h1 = textStyle.copyWith(
    fontSize: 96,
    fontWeight: FontWeight.w900,
  );
  static TextStyle h2 = textStyle.copyWith(
    fontSize: 60,
    fontWeight: FontWeight.w900,
  );
  static TextStyle h3 = textStyle.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );
  static TextStyle h4 = textStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static TextStyle h5 = textStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );
  static TextStyle h6 = textStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle h7 = textStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle st1 = textStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle st2 = textStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle b1 = textStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle b3 = textStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle b2 = textStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle bt = textStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle caption = textStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle overline = textStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
