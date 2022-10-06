import 'package:flutter/material.dart';
import 'package:solo_pago_cafe/pages/home_page.dart';
import 'package:solo_pago_cafe/pages/log_page.dart';
import 'package:solo_pago_cafe/pages/register_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/register': (_) => const RegisterPage(),
  '/log': (_) => const LogPage(),
  '/home': (_) => const HomePage(),
};
