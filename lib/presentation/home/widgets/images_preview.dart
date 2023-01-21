import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ImagesPreview extends StatelessWidget {
  const ImagesPreview(
      {required this.imagesPath,
      required this.onView,
      required this.onDeleteImage,
      Key? key})
      : super(key: key);
  final List<String> imagesPath;
  final ValueChanged<String> onView;
  final ValueChanged<String> onDeleteImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: imagesPath.isNotEmpty
          ? GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: imagesPath.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                childAspectRatio: 1.9,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => onView(imagesPath[index]),
                        child: Image.file(
                          File(imagesPath[index]),
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Center(
                              child: Image.asset(
                                ImgA.notImage.path,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => onDeleteImage(imagesPath[index]),
                        child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.black54,
                            child: Icon(Icons.close, color: Colors.white)),
                      ),
                    ),
                  ],
                );
              })
          : const SizedBox.shrink(),
    );
  }
}
