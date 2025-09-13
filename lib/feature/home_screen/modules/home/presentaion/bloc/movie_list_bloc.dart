import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/feature/home_screen/modules/home/domain/usecases/movie_list_usecases.dart';

import '../../../../../../core/error_handling/falliures.dart';
import '../../../../../authuntication/presentation/bloc/login_bloc.dart';
import '../../data/model/movie_list_response.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

@injectable
class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListUseCases movieListUseCases;

  MovieListBloc(this.movieListUseCases) : super(MovieListInit()) {
    on<GetMovieListEvent>((event, emit) async {
      print("Bloc recevied GetMovieListwith props=${event.limit}");

      emit(state.copyWith(movieListRequestState: RequestState.loading));
      var result = await movieListUseCases.getMovieListUseCases(
        limit: event.limit,
        genre: event.genre,
        minimumRating: event.minimumRating,
        orderBy: event.orderBy,
        page: event.page,
        quality: event.quality,
        queryTerm: event.queryTerm,
        sortBy: event.sortBy,
        withRtRatings: event.withRtRatings,
      );
      result.fold(
        (l) {
          print("Bloc failed with error=${l.message}");

          return emit(
            state.copyWith(
              movieListRequestState: RequestState.error,
              failure: l,
            ),
          );
        },
        (r) {
          print("Bloc success movie limit=${r.data.limit}");
          return emit(
            state.copyWith(
              movieListRequestState: RequestState.success,
              movieListModelResponse: r,
            ),
          );
        },
      );
    });
  }
}
