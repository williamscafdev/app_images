import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:app_images/core/core.dart';
import 'package:app_images/src/src.dart';

@lazySingleton
class LogOut {
  LogOut(this._iAuthRepository);
  final IAuthRepository _iAuthRepository;

  Future<Either<HttpException, void>> call() async {
    try {
      await _iAuthRepository.logOut();
      return right(null);
    } on HttpException catch (e) {
      return left(
        e,
      );
    }
  }
}
