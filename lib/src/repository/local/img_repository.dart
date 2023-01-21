import 'package:injectable/injectable.dart';

import '../../src.dart';

abstract class IImgRepository {
  Future<void> saveImage({
    required String urlImage,
  });
  Future<List<String>> getImages();
  Future<void> deleteImage({required String path});
}

@LazySingleton(as: IImgRepository)
class ImgRepository implements IImgRepository {
  ImgRepository(this._imgService);
  final ImgServices _imgService;

  @override
  Future<void> saveImage({
    required String urlImage,
  }) =>
      _imgService.saveImage(urlImage: urlImage);
  @override
  Future<List<String>> getImages() => _imgService.getImages();
  @override
  Future<void> deleteImage({required String path}) =>
      _imgService.deleteImage(path: path);
}
