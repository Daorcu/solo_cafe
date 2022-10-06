import 'package:flutter/material.dart';
import 'package:solo_pago_cafe/utils/colors.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final TextInputType type;
  final double height;
  final double width;
  final bool isPassword;
  final TextEditingController? textController;
  final TextCapitalization? textCapitalization;
  final Function(String)? onChanged;
  final bool autofocus;

  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.type,
    this.height = 60,
    this.width = 600,
    this.textCapitalization = TextCapitalization.none,
    required this.onChanged,
    this.isPassword = false,
    this.textController,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        autofocus: autofocus,
        controller: textController,
        obscureText: isPassword,
        textCapitalization: textCapitalization!,
        style: const TextStyle(color: AppColors.white),
        textAlign: TextAlign.start,
        cursorColor: AppColors.secondary,
        keyboardType: type,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.secondary),
              borderRadius: BorderRadius.circular(40.0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(40.0),
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.white,
          ),
          fillColor: AppColors.error,
          focusColor: AppColors.primary,
          labelStyle: const TextStyle(color: AppColors.white),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.white.withOpacity(0.4)),
          labelText: labelText,
        ),
        onChanged: onChanged,
        validator: (value) {
          if (value == null) return 'Este dato es requerido';
          return null;
        },
      ),
    );
  }
}
