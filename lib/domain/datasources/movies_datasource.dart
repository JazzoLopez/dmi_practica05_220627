// Contrato de acceso a datos de películas.
// Define las operaciones que deben implementar los datasources (API, cache, etc.).
import 'package:practica05/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
