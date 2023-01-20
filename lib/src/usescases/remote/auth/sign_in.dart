import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:app_images/core/core.dart';
import 'package:app_images/src/src.dart';

@lazySingleton
class SignIn {
  SignIn(this._iAuthRepository);
  final IAuthRepository _iAuthRepository;

  Future<Either<HttpException, void>> call({
    required String email,
    required String password,
  }) async {
    try {
      await _iAuthRepository.singInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(null);
    } on HttpException catch (e) {
      return left(
        e,
      );
    }
  }
}
