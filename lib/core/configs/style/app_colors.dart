import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3A454A);
  static const Color grey = Color(0x11F2F6FC);
  static const Color grey100 = Color(0xFF4B4D4D);
  static const Color grey200 = Color(0xFF404B57);
  static const Color red100 = Color(0xFFE53C3C);
  static const Color red200 = Color(0xFFFF0000);
  static const Color green100 = Color(0xFF36DC62);
  static const Color green200 = Color(0xFF3BEC9F);
  static const Color black100 = Color(0xFF000000);
  static const Color black200 = Color(0xFF082838);
  static const Color blue100 = Color(0xFF002AFF);
  static const Color blue200 = Color(0xFF025EC7);
  static const Color ambar100 = Color(0xFFE1C568);
  static const Color ambar200 = Color(0xFFC7A302);
  static const Color ambar300 = Color(0xFFF49F29);

  static const Color secondary = Color(0xFF82E2BA);

  static const Color black = Color(0xFF1E2028);

  static const Color white = Color(0xffffffff);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    final colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color),
      500: color,
      600: getShade(color, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}
