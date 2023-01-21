import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../src/src.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    initState();
  }
  final controllerUploadImage = TextEditingController();

  String _urlImage = '';
  String get urlImage => _urlImage;
  set urlImage(String value) {
    _urlImage = value;
    notifyListeners();
  }

  bool get hasImgUrl => urlImage != '';

  List<String> _images = [];
  List<String> get images => _images;
  set images(List<String> value) {
    _images = value;
    notifyListeners();
  }

  bool _isNetwork = false;
  bool get isNetwork => _isNetwork;
  set isNetwork(bool value) {
    _isNetwork = value;
    notifyListeners();
  }

  String _error = '';
  String get error => _error;
  set error(String value) {
    _error = value;
    notifyListeners();
  }

  void initState() {
    getImages();
  }

  void getImagePreview() {
    urlImage = controllerUploadImage.text;
    isNetwork = true;
  }

  Future<void> saveImage() async {
    if (images.length == 5) {
      return Future.error('Limite de imagenes alcanzado.');
    }
    final erroOrSaveImage = await sl<SaveImage>().call(
      urlImage: urlImage,
    );
    return await erroOrSaveImage.fold((l) {
      return Future.error(FException().mapException[l.statusCode].toString());
    }, (_) async {
      controllerUploadImage.clear();
      urlImage = '';
      await getImages();
    });
  }

  Future<void> getImages() async {
    final erroOrImages = await sl<GetImages>().call();
    return await erroOrImages.fold((l) {
      return Future.error(FException().mapException[l.statusCode].toString());
    }, (data) {
      images = data;
      notifyListeners();
    });
  }

  Future<void> deleteImage(String path) async {
    final erroOrDeleteImg = await sl<DeleteImage>().call(path: path);
    return await erroOrDeleteImg.fold((l) {
      return Future.error(FException().mapException[l.statusCode].toString());
    }, (_) {
      getImages();
    });
  }

  void onViewImage(String path) {
    urlImage = path;
    isNetwork = false;
  }

  @override
  void dispose() {
    controllerUploadImage.dispose();
    super.dispose();
  }
}
