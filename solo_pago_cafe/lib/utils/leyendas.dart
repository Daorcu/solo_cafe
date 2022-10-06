import 'package:flutter/material.dart';
import 'package:solo_pago_cafe/utils/colors.dart';

class Leyendas extends StatelessWidget {
  final String ruta;
  final String pregunta;
  final String cuenta;

  const Leyendas({
    Key? key,
    required this.ruta,
    required this.pregunta,
    required this.cuenta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pregunta,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        const SizedBox(height: 5),
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, ruta),
          child: Text(
            cuenta,
            style: const TextStyle(color: AppColors.secondary, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
