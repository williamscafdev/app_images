import 'package:flutter/material.dart';

import '../../../src/src.dart';

class GalleryViewModel extends ChangeNotifier {
  GalleryViewModel() {
    initState();
  }

  List<String> _images = [];
  List<String> get images => _images;
  set images(List<String> value) {
    _images = value;
    notifyListeners();
  }

  bool _isMosaico = false;
  bool get isMosaico => _isMosaico;
  set isMosaico(bool value) {
    _isMosaico = value;
    notifyListeners();
  }

  void initState() {
    getImages();
  }

  Future<void> getImages() async {
    final erroOrGetImages = await sl<GetImages>().call();
    return await erroOrGetImages.fold((l) {
      return Future.error(l);
    }, (r) {
      images = r;
    });
  }
}
