// Archivo principal de la aplicación Flutter.
// Configura la carga de variables de entorno, el contenedor de providers
// y arranca la app con navegación y tema global.
import 'package:flutter/material.dart';

import 'package:practica05/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:practica05/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
