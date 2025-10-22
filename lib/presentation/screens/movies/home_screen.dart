// Pantalla principal (Home).
// Muestra un header con el texto "220627" e iconos, y un carrusel de imágenes
// de películas (now playing) que rota automáticamente cada pocos segundos.
import 'dart:async';
import 'package:practica05/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.movie_outlined),
            SizedBox(width: 8),
            Text('220627'),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search), // Icono de búsqueda sin funcionalidad
          ),
        ],
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _autoPlayTimer;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      final movies = ref.read(nowPlayingMoviesProvider);
      if (movies.isEmpty) return;
      _currentPage = (_currentPage + 1) % movies.length;
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_currentPage >= nowPlayingMovies.length) {
      _currentPage = 0;
    }

    return Column(
      children: [
        const SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            controller: _pageController,
            itemCount: nowPlayingMovies.length,
            onPageChanged: (index) => _currentPage = index,
            itemBuilder: (context, index) {
              final movie = nowPlayingMovies[index];
              final imageUrl = (movie.backdropPath.isNotEmpty &&
                      movie.backdropPath !=
                          'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg')
                  ? movie.backdropPath
                  : movie.posterPath;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.broken_image_outlined, size: 48),
                          );
                        },
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black54, Colors.transparent],
                            ),
                          ),
                          child: Text(
                            movie.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
