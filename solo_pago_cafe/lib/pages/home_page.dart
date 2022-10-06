import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:solo_pago_cafe/utils/colors.dart';
import 'package:solo_pago_cafe/utils/custom_button.dart';

import 'package:solo_pago_cafe/providers/user_info_provider.dart';
import 'package:solo_pago_cafe/utils/custom_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nombreCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserInfoProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('¿Qué café nos tomamos hoy, ${userData.nombre}?'),
        backgroundColor: AppColors.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.gear),
              onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: AppColors.primary,
                  title: const Text(
                    'Preferencia de café',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Nombre de usuario
                      CustomInputField(
                        height: 60,
                        width: 160,
                        hintText: 'Nombre',
                        labelText: '${userData.nombre}',
                        icon: FontAwesomeIcons.solidUser,
                        type: TextInputType.text,
                        onChanged: (value) => userData.nombre = value,
                        textController: nombreCtrl,
                      ),
                      // Seleccionador de café
                      DropdownButtonFormField<String>(
                        hint: Text(
                          '¿Qué te tomas hoy, ${userData.nombre}?',
                          style: const TextStyle(color: AppColors.white),
                        ),
                        dropdownColor: AppColors.primary,
                        focusColor: AppColors.primary,
                        iconEnabledColor: AppColors.secondary,
                        items: [
                          DropdownMenuItem(
                              value: 'Café con leche',
                              child: Row(
                                children: const [
                                  Icon(FontAwesomeIcons.mugHot,
                                      color: AppColors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Café con leche',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Expresso',
                              child: Row(
                                children: const [
                                  Icon(FontAwesomeIcons.mugHot,
                                      color: AppColors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Expresso',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Americano',
                              child: Row(
                                children: const [
                                  Icon(FontAwesomeIcons.mugHot,
                                      color: AppColors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Americano',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                        onChanged: (value) => userData.coffee = value,
                      ),
                      // Seleccionador de azúcar
                      DropdownButtonFormField<String>(
                        hint: Text(
                          '¿Azúcar, ${userData.nombre}?',
                          style: const TextStyle(color: AppColors.white),
                        ),
                        dropdownColor: AppColors.primary,
                        focusColor: AppColors.primary,
                        iconEnabledColor: AppColors.secondary,
                        items: [
                          DropdownMenuItem(
                              value: 'Sin azúcar',
                              child: Row(
                                children: const [
                                  Icon(FontAwesomeIcons.mugHot,
                                      color: AppColors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Sin azúcar',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Una cucharada',
                              child: Row(
                                children: const [
                                  Icon(FontAwesomeIcons.mugHot,
                                      color: AppColors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Una cucharada',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Dos cucharadas',
                              child: Row(
                                children: const [
                                  Icon(FontAwesomeIcons.mugHot,
                                      color: AppColors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Dos cucharadas',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Sustituto',
                              child: Row(
                                children: const [
                                  Icon(FontAwesomeIcons.mugHot,
                                      color: AppColors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Sustituto',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                        onChanged: (value) => userData.sugar = value,
                      ),
                      // Botón ACEPTAR
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ButtonCustom(
                            primaryColor: AppColors.secondary.withOpacity(0.8),
                            text: 'Aceptar',
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: AppColors.primary,
                                  behavior: SnackBarBehavior.floating,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  content: Text(
                                    '¡Buena elección! Disfruta tu café, ${userData.nombre}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ));
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: IconButton(
                icon: const Icon(FontAwesomeIcons.doorOpen),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/log')),
          )
        ],
      ),
      body: userData.coffee == null && userData.sugar == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.mugSaucer,
                    size: 60,
                    color: AppColors.grey.withOpacity(0.5),
                  ),
                  Text('Prepara tu café',
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grey.withOpacity(0.5))),
                ],
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('fondo3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              offset: const Offset(1, 1)),
                        ],
                      ),
                      height: 250,
                      width: 250,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Stack(children: [
                            Positioned(
                              right: -10,
                              bottom: -10,
                              child: Icon(
                                FontAwesomeIcons.mugHot,
                                color: AppColors.white.withOpacity(0.2),
                                size: 180,
                              ),
                            ),
                            Positioned(
                                child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // const SizedBox(height: 45),
                                    Text(
                                      '${userData.nombre}',
                                      style: const TextStyle(
                                          color: AppColors.white, fontSize: 35),
                                    ),
                                    Text('Usuario',
                                        style: TextStyle(
                                            color: AppColors.white
                                                .withOpacity(0.5),
                                            fontSize: 15)),
                                    const SizedBox(height: 45),
                                    Text(
                                      '${userData.coffee} con ${userData.sugar}',
                                      style: const TextStyle(
                                          color: AppColors.white, fontSize: 25),
                                    ),
                                    Text(
                                      'Tomando',
                                      style: TextStyle(
                                          color:
                                              AppColors.white.withOpacity(0.5),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ]),
                            ))
                          ])))),
            ),
    );
  }
}
