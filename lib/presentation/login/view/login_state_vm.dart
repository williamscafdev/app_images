import 'package:app_images/src/src.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel() : super();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String _error = '';
  String get error => _error;
  set error(String value) {
    _error = value;
    notifyListeners();
  }

  Future<void> logIn() async {
    final erroOrSignIn = await sl<SignIn>().call(
      email: emailController.text,
      password: passwordController.text,
    );
    return await erroOrSignIn.fold(
      (l) {
        error = FException().mapException[l.statusCode].toString();
        return Future.error(l);
      },
      (_) {},
    );
  }
}
