part of 'movie_list_bloc.dart';

class MovieListState {
  final RequestState? movieListRequestState;
  final MovieListResponse? movieListModelResponse;
  final MovieFailure? failure;

  MovieListState({
    this.failure,
    this.movieListModelResponse,
    this.movieListRequestState,
  });

  MovieListState copyWith({
    RequestState? movieListRequestState,
    MovieListResponse? movieListModelResponse,
    MovieFailure? failure,
  }) {
    return MovieListState(
      movieListRequestState:
          movieListRequestState ?? this.movieListRequestState,
      movieListModelResponse:
          movieListModelResponse ?? this.movieListModelResponse,
      failure: failure ?? this.failure,
    );
  }
}

final class MovieListInit extends MovieListState {
  MovieListInit() : super(movieListRequestState: RequestState.init);
}
