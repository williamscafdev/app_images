import 'package:app_images/core/core.dart';
import 'package:app_images/src/src.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetImages {
  GetImages(this._iImgRepository);
  final IImgRepository _iImgRepository;

  Future<Either<HttpException, List<String>>> call() async {
    try {
      final result = await _iImgRepository.getImages();
      return right(result);
    } on HttpException catch (e) {
      return left(
        e,
      );
    }
  }
}
