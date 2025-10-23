// Pantalla principal (Home).
// Muestra un header con el texto "220627" e iconos, y un carrusel de imágenes
// de películas (now playing) que rota automáticamente cada pocos segundos.
import 'package:practica05/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practica05/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:practica05/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:practica05/presentation/widgets/movies/movies_slideshow.dart';
import 'package:practica05/presentation/widgets/shared/custom_appbar.dart';
import 'package:practica05/presentation/widgets/shared/custom_bottom_navigationbar.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlaying = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(movieSlideShowProvider);

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideshow(movies: slideShowMovies),
        MovieHorizontalListview(
          movies: nowPlaying,
          title: 'En cines',
          subtitle: '22 de Oct',
        ),
      ],
    );
  }
}
