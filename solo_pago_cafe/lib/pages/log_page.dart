import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solo_pago_cafe/utils/colors.dart';
import 'package:solo_pago_cafe/utils/custom_button.dart';
import 'package:solo_pago_cafe/utils/custom_input.dart';
import 'package:solo_pago_cafe/utils/leyendas.dart';

class LogPage extends StatelessWidget {
  const LogPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.8),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('fondo2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Iniciar sesión',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 50,
              ),
            ),
            _FormSession(),
            Leyendas(
              pregunta: '¿No tienes una cuenta?',
              cuenta: 'Crear cuenta',
              ruta: '/register',
            ),
          ],
        ),
      ),
    );
  }
}

class _FormSession extends StatefulWidget {
  const _FormSession({Key? key}) : super(key: key);

  @override
  State<_FormSession> createState() => __FormSessionState();
}

class __FormSessionState extends State<_FormSession> {
  final correoCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInputField(
            hintText: 'Ingresa tu correo',
            labelText: 'Correo',
            icon: FontAwesomeIcons.at,
            type: TextInputType.emailAddress,
            onChanged: (_) {},
            textController: correoCtrl, // => userData.altura = value,
          ),
          const SizedBox(height: 15),
          CustomInputField(
            hintText: 'Ingresa tu contraseña',
            labelText: 'Contraseña',
            icon: FontAwesomeIcons.lock,
            type: TextInputType.text,
            isPassword: true,
            onChanged: (_) {},
            textController: passwordCtrl, // => userData.altura = value,
          ),
          const SizedBox(height: 15),
          ButtonCustom(
              primaryColor: AppColors.secondary.withOpacity(0.8),
              text: 'Iniciar sesión',
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/home')),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
