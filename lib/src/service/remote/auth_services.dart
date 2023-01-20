import 'dart:async';

import 'package:injectable/injectable.dart';

@lazySingleton
class AuthServices {
  AuthServices();

  Future<void> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {} on Exception {}
  }

  Future<void> logOut() async {
    try {} on Exception {}
  }
}
