// Implementación del repositorio de películas.
// Delegación al datasource concreto y exposición de métodos del dominio.
import 'package:practica05/domain/datasources/movies_datasource.dart';
import 'package:practica05/domain/entities/movie.dart';
import 'package:practica05/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
