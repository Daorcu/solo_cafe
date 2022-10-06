import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:solo_pago_cafe/utils/colors.dart';
import 'package:solo_pago_cafe/utils/leyendas.dart';
import 'package:solo_pago_cafe/utils/custom_input.dart';
import 'package:solo_pago_cafe/utils/custom_button.dart';

import 'package:solo_pago_cafe/providers/user_info_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserInfoProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.8),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Registro',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 50,
              ),
            ),
            _FormSession(userData: userData),
            const Leyendas(
              pregunta: '¿Ya tienes una cuenta?',
              cuenta: 'Iniciar sesión',
              ruta: '/log',
            ),
          ],
        ),
      ),
    );
  }
}

class _FormSession extends StatefulWidget {
  final UserInfoProvider userData;

  const _FormSession({Key? key, required this.userData}) : super(key: key);

  @override
  State<_FormSession> createState() => __FormSessionState();
}

class __FormSessionState extends State<_FormSession> {
  final nombreCtrl = TextEditingController();
  final correoCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserInfoProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInputField(
            hintText: 'Ingresa tu nombre',
            labelText: 'Nombre',
            icon: FontAwesomeIcons.solidUser,
            type: TextInputType.text,
            onChanged: (value) => userData.nombre = value,
            textController: nombreCtrl,
          ),
          const SizedBox(height: 15),
          CustomInputField(
            hintText: 'Ingresa tu correo',
            labelText: 'Correo',
            icon: FontAwesomeIcons.at,
            type: TextInputType.emailAddress,
            onChanged: (value) => userData.correo = value,
            textController: correoCtrl,
          ),
          const SizedBox(height: 15),
          CustomInputField(
            hintText: 'Crea una contraseña',
            labelText: 'Contraseña',
            icon: FontAwesomeIcons.lock,
            type: TextInputType.text,
            isPassword: true,
            onChanged: (value) => userData.password = value,
            textController: passwordCtrl,
          ),
          const SizedBox(height: 15),
          ButtonCustom(
              primaryColor: AppColors.secondary.withOpacity(0.8),
              text: 'Iniciar',
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/home')),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
