// Variables de entorno y llaves de configuración.
// Expone valores cargados desde .env para uso en toda la app.
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
}
