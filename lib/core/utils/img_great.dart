import 'package:app_images/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:shimmer/shimmer.dart';

class ImgGreat extends StatelessWidget {
  const ImgGreat({
    required this.img,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.fit = BoxFit.contain,
    this.isNetwork = false,
    super.key,
  });
  final ImgA img;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final BoxFit? fit;
  final bool? isNetwork;

  bool convertImage() {
    if (img.path.split('.').last != 'svg') {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) =>
      isNetwork! ? buildImgNetWork() : buildImg();

  Widget buildImgNetWork() => Padding(
        padding: padding ?? pad0,
        child: Image(
          height: height,
          width: width,
          fit: fit,
          image: SvgImage.cachedNetwork(img.path, currentColor: color),
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) =>
              loadingProgress == null
                  ? child
                  : Shimmer(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey[300]!,
                          Colors.grey[100]!,
                          Colors.grey[300]!,
                        ],
                      ),
                      child: SizedBox(
                        height: height,
                        width: width,
                      ),
                    ),
          errorBuilder: (
            BuildContext context,
            Object exception,
            StackTrace? stackTrace,
          ) =>
              Shimmer(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[300]!,
                Colors.grey[100]!,
                Colors.grey[300]!,
              ],
            ),
            child: SizedBox(
              height: height,
              width: width,
            ),
          ),
        ),
      );

  Widget buildImg() => convertImage()
      ? Padding(
          padding: padding ?? pad0,
          child: SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              img.path,
              height: height,
              width: width,
              fit: fit!,
              placeholderBuilder: (BuildContext context) => Center(
                child: Shimmer(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[100]!,
                      Colors.grey[300]!,
                    ],
                  ),
                  child: SizedBox(
                    height: height,
                    width: width,
                  ),
                ),
              ),
            ),
          ),
        )
      : Padding(
          padding: padding ?? pad0,
          child: Image.asset(
            img.path,
            color: color,
            height: height,
            width: width,
            fit: fit,
            errorBuilder: (
              BuildContext context,
              Object exception,
              StackTrace? stackTrace,
            ) =>
                Shimmer(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[300]!,
                  Colors.grey[100]!,
                  Colors.grey[300]!,
                ],
              ),
              child: SizedBox(
                height: height,
                width: width,
              ),
            ),
          ),
        );
}
