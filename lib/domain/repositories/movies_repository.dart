// Contrato del repositorio de películas.
// Orquesta la obtención de datos desde datasources y expone casos de uso al dominio.
import 'package:practica05/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
