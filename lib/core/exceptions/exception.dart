import '../../src/src.dart';

class FException {
  factory FException() => _instance;
  FException._();
  static final FException _instance = FException._();
  Map<int, String> get mapException => {
        500: MException.serverError.msg,
        403: MException.invalidEmail.msg,
        401: MException.validateCredentials.msg,
        402: MException.weakPassword.msg,
      };
}
