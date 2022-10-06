import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:solo_pago_cafe/routes/routes.dart';
import 'package:solo_pago_cafe/pages/register_page.dart';
import 'package:solo_pago_cafe/providers/user_info_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Café Solo Pago',
      routes: appRoutes,
      home: const RegisterPage(),
    );
  }
}
