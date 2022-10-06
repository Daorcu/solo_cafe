import 'package:flutter/material.dart';
import 'package:solo_pago_cafe/utils/colors.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget {
  Color? onPrimaryColor;
  Color? primaryColor;
  String? text;
  VoidCallback? onPressed;

  ButtonCustom({
    Key? key,
    this.onPrimaryColor,
    this.primaryColor = AppColors.primary,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: onPrimaryColor,
      primary: primaryColor,
      minimumSize: const Size(100, 35),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
    return Center(
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: onPressed,
        child: Text(text!),
      ),
    );
  }
}
