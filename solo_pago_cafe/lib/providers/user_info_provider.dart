import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String? _nombre;
  String? _correo;
  String? _password;
  String? _coffee;
  String? _sugar;

  String? get nombre => _nombre;
  set nombre(String? nombre) {
    _nombre = nombre;
    notifyListeners();
  }

  String? get correo => _correo;
  set correo(String? correo) {
    _correo = correo;
    notifyListeners();
  }

  String? get password => _password;
  set password(String? password) {
    _password = password;
    notifyListeners();
  }

  String? get coffee => _coffee;
  set coffee(String? coffee) {
    _coffee = coffee;
    notifyListeners();
  }

  String? get sugar => _sugar;
  set sugar(String? sugar) {
    _sugar = sugar;
    notifyListeners();
  }

  List usuariosConectados = [];

  usuarioConectado(
    String nombre,
    String coffee,
    String sugar,
  ) {
    usuariosConectados.add([
      nombre,
      coffee,
      sugar,
    ]);
    notifyListeners();
  }
}
