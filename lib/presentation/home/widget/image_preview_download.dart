import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreviewDownload extends StatelessWidget {
  const ImagePreviewDownload(
      {required this.urlImage, this.isNetwork = true, Key? key})
      : super(key: key);
  final String urlImage;
  final bool isNetwork;
  @override
  Widget build(BuildContext context) {
    return urlImage != ''
        ? buildImg(isNetwork)
        : Image.asset(
            'assets/images/not-image.jpeg',
            height: 300,
            width: double.infinity,
          );
  }

  Widget buildImg(bool isNetwork) {
    if (isNetwork) {
      return SizedBox(
        height: 300,
        width: double.infinity,
        child: Image.network(
          urlImage,
          frameBuilder: (BuildContext context, Widget child, int? frame,
              bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              child: child,
            );
          },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
              height: 300,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const SizedBox(
              height: 300,
              width: double.infinity,
              child: Center(
                child: Text('Error'),
              ),
            );
          },
        ),
      );
    } else {
      return SizedBox(
        height: 300,
        width: double.infinity,
        child: Image.file(
          File(urlImage),
          height: 300,
          width: double.infinity,
        ),
      );
    }
  }
}
