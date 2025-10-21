// Definición del tema global de la aplicación.
// Centraliza colores, tipografías y configuración de Material 3.

import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF2862F5));
}
