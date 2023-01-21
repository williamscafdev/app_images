import 'package:app_images/core/core.dart';
import 'package:app_images/src/src.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteImage {
  DeleteImage(this._iImgRepository);
  final IImgRepository _iImgRepository;

  Future<Either<HttpException, void>> call({required String path}) async {
    try {
      await _iImgRepository.deleteImage(path: path);
      return right(null);
    } on HttpException catch (e) {
      return left(
        e,
      );
    }
  }
}
