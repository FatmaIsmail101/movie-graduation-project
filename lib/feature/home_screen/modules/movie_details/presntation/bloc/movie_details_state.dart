part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final RequestState? movieDetailsRequestState;
  final MovieDetailsResponse? movieDetailsModelResponse;
  final MovieFailure? failure;

  const MovieDetailsState({
    this.movieDetailsRequestState,
    this.movieDetailsModelResponse,
    this.failure,
  });

  MovieDetailsState copyWith({
    RequestState? movieDetailsRequestState,
    MovieDetailsResponse? movieDetailsModelResponse,
    MovieFailure? failure,
  }) {
    return MovieDetailsState(
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsModelResponse:
          movieDetailsModelResponse ?? this.movieDetailsModelResponse,
      failure: failure ?? this.failure,
    );
  }
}

final class MovieDetailsInitial extends MovieDetailsState {
  MovieDetailsInitial() : super(movieDetailsRequestState: RequestState.init);
}
