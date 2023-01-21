import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../core/core.dart';

@lazySingleton
class AuthServices {
  AuthServices();

  Future<void> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (email == 'test' && password == 'test') {
        return Future.value();
      } else {
        throw HttpRequestFailure.unauthorized;
      }
    } catch (e) {
      if (e is HttpRequestFailure) {
        throw HttpException(
          statusCode: e.statusCode,
        );
      }
      throw HttpException(
        statusCode: 500,
      );
    }
  }

  Future<void> logOut() async {}
}
