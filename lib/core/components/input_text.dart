import 'package:flutter/material.dart';
import 'package:app_images/core/core.dart';

enum ErrorType {
  required,
  isEmpty,
  minLenght,
  maxLenght,
  success,
}

class InputText extends StatefulWidget {
  const InputText({
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.controller,
    this.errorMessage,
    this.errorMessageValidator,
    this.maxLenght,
    this.minLenght,
    this.iconSuffix,
    this.suffixText,
    super.key,
  });
  final String hint;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorMessage;
  final String? errorMessageValidator;
  final int? maxLenght;
  final int? minLenght;
  final IconButton? iconSuffix;
  final Widget? suffixText;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  String? errorMessageText;
  bool isCompleted = false;
  int maxLenght = 0;
  int minLenght = 0;

  void errorValidation(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.required:
        errorMessageText =
            widget.errorMessage ?? 'Ingresar ${widget.hint.toLowerCase()}';
        isCompleted = false;
        setState(() {});
        break;
      case ErrorType.minLenght:
        errorMessageText = '${widget.hint} debe tener al menos '
            '${widget.minLenght} caracteres';
        isCompleted = false;
        setState(() {});
        break;
      case ErrorType.maxLenght:
        errorMessageText = '${widget.hint} debe tener maxímo '
            '${widget.maxLenght} caracteres';
        isCompleted = false;
        setState(() {});
        break;
      case ErrorType.isEmpty:
        errorMessageText = 'Falta agregar datos ${widget.hint.toLowerCase()}';
        isCompleted = false;
        setState(() {});
        break;
      case ErrorType.success:
        errorMessageText = 'Completo';
        isCompleted = true;
        setState(() {});
        break;
    }
  }

  void errorText(String value) {
    if (widget.controller != null) {
      if (value.isEmpty) {
        errorValidation(ErrorType.required);
      }
      if (value.isNotEmpty &&
          widget.minLenght != null &&
          value.length < widget.minLenght!) {
        errorValidation(ErrorType.minLenght);
      }
      if (value.isNotEmpty &&
          widget.maxLenght != null &&
          value.length > widget.maxLenght!) {
        errorValidation(ErrorType.maxLenght);
      }

      if (value.isNotEmpty &&
          widget.maxLenght != null &&
          value.length <= widget.maxLenght!) {
        errorValidation(ErrorType.success);
      }
      if (value.isNotEmpty &&
          widget.minLenght != null &&
          value.length >= widget.minLenght!) {
        errorValidation(ErrorType.success);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    maxLenght = widget.maxLenght ?? 0;
    minLenght = widget.minLenght ?? 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText!,
        onChanged: errorText,
        cursorColor: AppColors.grey200,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: true,
          selectAll: true,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            errorMessageText = 'j';
            setState(() {});
            return widget.errorMessageValidator ??
                'Complete los campos del formulario.';
          }
          return null;
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: widget.hint,
          hintStyle: TgyStyle.b1.grey200.w700,
          suffixIcon: widget.suffixText,
          errorText: errorMessageText,
          errorStyle: TgyStyle.caption.red100.copyWith(
            color: errorMessageText != null
                ? isCompleted
                    ? AppColors.green200
                    : AppColors.red100
                : Colors.transparent,
            fontSize: errorMessageText != null ? 12 : 0,
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey100),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey100),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey100),
          ),
          fillColor: AppColors.grey,
          filled: true,
        ),
      );
}
