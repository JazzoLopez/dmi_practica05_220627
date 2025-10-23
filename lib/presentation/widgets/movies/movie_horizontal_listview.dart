import 'package:flutter/material.dart';
import 'package:practica05/domain/entities/movie.dart';

class MovieHorizontalListview extends StatelessWidget {

  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _CurrDate(place: title, formattedDate: subtitle,),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  return child;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CurrDate extends StatelessWidget {
  final String? place;
  final String? formattedDate;

  const _CurrDate({
    this.place,
    this.formattedDate,
  });

  @override
  Widget build(BuildContext context) {
    final placeStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(place != null)
            Text(place!, style: placeStyle,),
          Spacer(),
          if(formattedDate != null)
            FilledButton.tonal(onPressed: (){}, child: Text(formattedDate!))
        ],
      ),
    );
  }
}