import 'package:flutter/material.dart';
import 'package:app_images/core/core.dart';

class Button extends StatelessWidget {
  const Button({
    required this.onPressed,
    required this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    this.backGroundColor = AppColors.green200,
    this.isEnabled = true,
    this.textColor = AppColors.black,
    super.key,
  });
  final VoidCallback onPressed;
  final String label;
  final EdgeInsets padding;
  final Color backGroundColor;
  final bool isEnabled;
  final Color textColor;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TgyStyle.b2.w600.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      );
}
