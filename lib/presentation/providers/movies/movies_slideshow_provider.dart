import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practica05/presentation/providers/movies/movies_providers.dart';
import 'package:practica05/domain/entities/movie.dart';
import 'package:practica05/presentation/providers/providers.dart';



final movieSlideShowProvider = Provider<List<Movie>>((ref) {
  {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    if (nowPlayingMovies.isEmpty) return [];
    return nowPlayingMovies.sublist(0, 6);
  }
});
