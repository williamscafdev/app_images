import 'package:injectable/injectable.dart';
import 'package:app_images/src/src.dart';

abstract class IAuthRepository {
  Future<void> singInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> logOut();
}

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository(this._authService);
  final AuthServices _authService;

  @override
  Future<void> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _authService.singInWithEmailAndPassword(email: email, password: password);

  @override
  Future<void> logOut() => _authService.logOut();
}
