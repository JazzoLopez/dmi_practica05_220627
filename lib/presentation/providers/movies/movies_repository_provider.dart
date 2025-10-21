// Provider que expone la implementación del repositorio de películas.
// Permite inyectar y testear fácilmente el datasource en la capa de presentación.
import 'package:practica05/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practica05/infrastructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
