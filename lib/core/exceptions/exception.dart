import '../../src/src.dart';

class FException {
  factory FException() => _instance;
  FException._();
  static final FException _instance = FException._();
  Map<String, String> get mapException => {
        'email-already-in-use': MException.emailAlreadyInUse.msg,
        'invalid-email': MException.invalidEmail.msg,
        'operation-not-allowed': MException.operationNotAllowed.msg,
        'weak-password': MException.weakPassword.msg,
        'user-disabled': MException.userDisabled.msg,
        'user-not-found': MException.userNotFound.msg,
        'wrong-password': MException.wrongPassword.msg,
        'too-many-requests': MException.tooManyRequests.msg,
      };
}
