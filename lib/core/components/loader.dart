import 'package:app_images/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum StatusProcess {
  onLoading,
  onLoaded,
  onEmpty,
  onError,
}

abstract class ProgressDialogo {
  static Future<dynamic> showLoader(BuildContext context) =>
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImgGreat(
                img: ImgA.logo,
              ),
              gap16,
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.green200.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      );
  static Future<dynamic> showSnackBar(BuildContext context) =>
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          width: double.infinity,
          height: 200,
          color: Colors.black12.withOpacity(0.5),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.green200.withOpacity(0.5),
              ),
            ),
          ),
        ),
      );
  static Future<void> show({
    required BuildContext context,
    required Future<dynamic> Function() onLoading,
    required VoidCallback onSuccess,
    VoidCallback? onError,
  }) async {
    final popUp = showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImgGreat(
                img: ImgA.logo,
              ),
              gap16,
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.green200.withOpacity(0.5),
                ),
              ),
            ],
          ),
        );
      },
    );
    try {
      await onLoading().then(
        (value) => Navigator.pop(context),
      );
      onSuccess();
    } catch (err) {
      Navigator.pop(context);
      if (onError != null) {
        onError();
      } else {
        rethrow;
      }
    }
    return popUp;
  }

  static Widget showWidget({
    StatusProcess status = StatusProcess.onLoading,
    Widget? onLoaded,
    Widget? onEmpty,
    Widget? onError,
  }) {
    switch (status) {
      case StatusProcess.onLoading:
        return const Center(child: CircularProgressIndicator());
      case StatusProcess.onLoaded:
        return onLoaded ?? const SizedBox();
      case StatusProcess.onEmpty:
        return onEmpty ?? const SizedBox();
      case StatusProcess.onError:
        return onError ?? const SizedBox();
    }
  }

  static Widget showLoading() =>
      const Center(child: CircularProgressIndicator());

  static void dissmiss(BuildContext context) => Navigator.pop(context);
}
