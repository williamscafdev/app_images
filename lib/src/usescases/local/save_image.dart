import 'package:app_images/core/core.dart';
import 'package:app_images/src/src.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveImage {
  SaveImage(this._iImgRepository);
  final IImgRepository _iImgRepository;

  Future<Either<HttpException, void>> call({
    required String urlImage,
  }) async {
    try {
      await _iImgRepository.saveImage(
        urlImage: urlImage,
      );
      return right(null);
    } on HttpException catch (e) {
      return left(
        e,
      );
    }
  }
}
