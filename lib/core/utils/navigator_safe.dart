import 'package:flutter/material.dart';

extension NavigatorX on BuildContext {
  void popNavigatorIf({required bool value}) {
    if (value) safeNavigatorPop();
  }

  void safeNavigatorPop() {
    if (Navigator.canPop(this)) Navigator.pop(this);
  }

  NavigatorState get navigator => Navigator.of(this);
  Future<T?> navigate<T extends Object>(Widget widget) => navigator.push(
        MaterialPageRoute<T>(
          builder: (_) => widget,
        ),
      );
}
