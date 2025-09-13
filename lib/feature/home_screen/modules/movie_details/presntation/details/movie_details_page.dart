import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/feature/home_screen/modules/movie_details/presntation/bloc/movie_details_bloc.dart';
import 'package:movies/feature/home_screen/modules/movie_details/presntation/details/widgets/cast/cast_section.dart';

import '../../../../../authuntication/presentation/bloc/login_bloc.dart';
import 'widgets/genres_section.dart';
import 'widgets/poster/info_section.dart';
import 'widgets/poster/poster_section.dart';
import 'widgets/poster/stats_section.dart';
import 'widgets/screenshots_section.dart';
import 'widgets/similar_movies_section.dart';
import 'widgets/summary_section.dart';

@injectable
class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (BuildContext context) =>
            getIt<MovieDetailsBloc>()
              ..add(GetMovieDetailsEvent(movieId: movieId)),
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state.movieDetailsRequestState == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.movieDetailsRequestState == RequestState.success) {
              final movie = state.movieDetailsModelResponse?.data.movie;
              print(state.movieDetailsModelResponse?.toJson());
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PosterSection(movie: movie),
                    InfoSection(movie: movie),
                    StatsSection(movie: movie),
                    ScreenshotsSection(movie: movie),
                    if (state.movieSuggestionRequestState ==
                        RequestState.loading)
                      const Center(child: CircularProgressIndicator())
                    else
                      SimilarMoviesSection(
                        suggestionModelResponse:
                            state.movieSuggestionModelResponse,
                      ),
                    SummarySection(movie: movie),
                    CastSection(movie: movie),
                    GenresSection(movie: movie),
                  ],
                ),
              );
            } else if (state.movieDetailsRequestState == RequestState.error) {
              return Center(child: Text("Error: ${state.failure?.message}"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
