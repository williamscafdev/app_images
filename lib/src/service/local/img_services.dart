import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/core.dart';
import '../../src.dart';

@lazySingleton
class ImgServices {
  ImgServices();

  final _dio = DioHttpService().dio;

  Future<void> saveImage({
    required String urlImage,
  }) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final directory = Directory('${appDocDir.path}/${Paths.agrosImg.path}');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    try {
      String baseNameImg = urlImage.split('.').last;
      String nameImg = DateTime.now().microsecondsSinceEpoch.toString();
      final result = await _dio.get(
        urlImage,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
      );
      if (result.statusCode == 200) {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        File file = File(
            '${appDocDir.path}/${Paths.agrosImg.path}/$nameImg.$baseNameImg');
        await file.writeAsBytes(result.data);
      } else {
        throw HttpException(
          statusCode: result.statusCode,
        );
      }
    } catch (e) {
      if (e is HttpRequestFailure) {
        throw HttpException(
          statusCode: e.statusCode,
        );
      }
      throw HttpException(
        statusCode: 500,
      );
    }
  }

  Future<List<String>> getImages() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final directory = Directory('${appDocDir.path}/${Paths.agrosImg.path}');
    final images = directory.listSync().whereType<File>();

    return images.map((e) => e.path).toList();
  }

  Future<void> deleteImage({required String path}) async {
    final file = File(path);
    await file.delete();
  }
}
