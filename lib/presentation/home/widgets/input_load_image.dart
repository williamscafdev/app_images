import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class InputLoadImage extends StatelessWidget {
  const InputLoadImage(
      {required this.controller, required this.onPressed, Key? key})
      : super(key: key);
  final TextEditingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: InputText(
            controller: controller,
            minLenght: 3,
            hint: 'home.inputText.hint'.tr(),
          ),
        ),
        space10,
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onPressed,
          child: Container(
            padding: padSy8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.green200,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Text(
                  'home.button.getImage'.tr(),
                  style: const TextStyle(
                    color: AppColors.green200,
                  ),
                ),
                space10,
                const Icon(Icons.download),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
