import 'package:app_images/src/src.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel() : super();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> logIn() async {
    final erroOrSignIn = await sl<SignIn>().call(
      email: emailController.text,
      password: passwordController.text,
    );
    return await erroOrSignIn.fold(
      (l) {
        return Future.error(FException().mapException[l.statusCode].toString());
      },
      (_) {},
    );
  }
}
