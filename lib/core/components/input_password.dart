import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:app_images/core/core.dart';

class InputPassword extends HookWidget {
  const InputPassword({required this.passwordController, super.key});
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(true);
    return InputText(
      controller: passwordController,
      obscureText: showPassword.value,
      hint: 'Contraseña',
      minLenght: 6,
      iconSuffix: IconButton(
        onPressed: () {
          showPassword.value = !showPassword.value;
        },
        icon: Icon(
          showPassword.value
              ? Icons.remove_red_eye
              : Icons.remove_red_eye_outlined,
          color: showPassword.value ? AppColors.grey100 : AppColors.primary,
        ),
      ),
    );
  }
}
