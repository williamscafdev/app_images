import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ButtonSaveImage extends StatelessWidget {
  const ButtonSaveImage(
      {required this.onPressed,
      required this.hasImgUrl,
      required this.messageError,
      Key? key})
      : super(key: key);
  final Function() onPressed;
  final bool hasImgUrl;
  final String messageError;

  @override
  Widget build(BuildContext context) {
    return Button(
      label: 'home.saveImage'.tr(),
      onPressed: () => ProgressDialogo.show(
        context: context,
        onLoading: () => onPressed(),
        onSuccess: () => _onShowInformation(
          context,
          'home.messageSuccess'.tr(),
        ),
        onError: (error) => _onShowInformation(
          context,
          error,
        ),
      ),
      isEnabled: hasImgUrl,
      borderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
    );
  }

  void _onShowInformation(
    BuildContext context,
    String message,
  ) =>
      showDialogInformation(
        context: context,
        title: 'home.showMessage.title'.tr(),
        message: message,
        onPressed: () => context.safeNavigatorPop(),
      );
}
