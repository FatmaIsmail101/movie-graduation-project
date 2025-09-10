import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/movies_repository.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository repository;

  MoviesBloc(this.repository) : super(MoviesInitial()) {
    on<LoadMoviesEvent>((event, emit) async {
      try {
        if (!event.isLoadMore) emit(MoviesLoading());

        final movies = await repository.getMovies(
          page: event.page,
          genre: event.genre,
        );

        if (state is MoviesLoaded && event.isLoadMore) {
          final oldMovies = (state as MoviesLoaded).movies;
          emit(
            MoviesLoaded([...oldMovies, ...movies], hasMore: movies.isNotEmpty),
          );
        } else {
          emit(MoviesLoaded(movies, hasMore: movies.isNotEmpty));
        }
      } catch (e) {
        emit(MoviesError(e.toString()));
      }
    });
  }
}
