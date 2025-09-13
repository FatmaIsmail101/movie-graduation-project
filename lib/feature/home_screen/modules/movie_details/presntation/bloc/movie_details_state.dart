part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final RequestState? movieDetailsRequestState;
  final MovieDetailsResponse? movieDetailsModelResponse;
  final MovieFailure? failure;
  final RequestState? movieSuggestionRequestState;
  final SuggestionModelResponse? movieSuggestionModelResponse;

  const MovieDetailsState({
    this.movieDetailsRequestState,
    this.movieDetailsModelResponse,
    this.failure,
    this.movieSuggestionModelResponse,
    this.movieSuggestionRequestState
  });

  MovieDetailsState copyWith({
    RequestState? movieDetailsRequestState,
    MovieDetailsResponse? movieDetailsModelResponse,
    MovieFailure? failure,
    final RequestState? movieSuggestionRequestState,
    final SuggestionModelResponse? movieSuggestionModelResponse

  }) {
    return MovieDetailsState(
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsModelResponse:
          movieDetailsModelResponse ?? this.movieDetailsModelResponse,
      failure: failure ?? this.failure,
        movieSuggestionModelResponse: movieSuggestionModelResponse ??
            this.movieSuggestionModelResponse,
        movieSuggestionRequestState: movieSuggestionRequestState ??
            this.movieSuggestionRequestState
    );
  }
}

final class MovieDetailsInitial extends MovieDetailsState {
  MovieDetailsInitial() : super(movieDetailsRequestState: RequestState.init);
}
