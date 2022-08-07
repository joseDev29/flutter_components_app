import 'package:flutter/material.dart';

import 'package:components_app/router/app_routes.dart';
import 'package:components_app/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.getAppRoutes(),
      //Se ejecuta cuando se intenta ir a una ruta no existente
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
