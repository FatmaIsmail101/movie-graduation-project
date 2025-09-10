import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../bloc/movies_event.dart';
import '../../model/movie_model.dart';
import '../../repository/movies_repository.dart';
import '../see_more_screen.dart';
import 'moive_card.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;

  const MovieSection({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) =>
                            MoviesBloc(MoviesRepository())
                              ..add(LoadMoviesEvent(title)),
                        child: SeeMoreScreen(genre: title),
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "See More",
                      style: TextStyle(fontSize: 14, color: Colors.amber),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward, color: Colors.amber, size: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length > 6 ? 6 : movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: MovieCard(movie: movies[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
