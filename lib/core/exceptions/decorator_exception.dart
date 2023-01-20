import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:app_images/core/core.dart';

class FirebaseExceptionHandler {
  static handleFirebaseExceptions(Function originalFunction) {
    return (dynamic e) {
      if (e is PlatformException) {
        switch (e.code) {
          case 'ERROR_INVALID_EMAIL':
            log('The password is incorrect');
            throw HttpException(
              title: 'Http get Auth!',
              codeErrorFirebase: e.code,
              message: e.message,
            );
          case 'ERROR_WRONG_PASSWORD':
            log('The password is incorrect');
            throw HttpException(
              title: 'Http get Auth!',
              codeErrorFirebase: e.code,
              message: e.message,
            );
          default:
            log('An error occurred: $e');
            throw HttpException(
              title: 'Http get Auth!',
              codeErrorFirebase: e.code,
              message: e.message,
            );
        }
      }
      throw HttpException(
        title: 'Http get unknown!',
        codeErrorFirebase: e.runtimeType.toString(),
        message: e.toString(),
      );
    };
  }
}
