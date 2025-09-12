part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object?> get props => [];
}

/// Event عشان نجيب تفاصيل فيلم
class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;
  final bool withImages;
  final bool withCast;

  const GetMovieDetailsEvent({
    required this.movieId,
    this.withImages = true,
    this.withCast = true,
  });

  @override
  List<Object?> get props => [movieId, withImages, withCast];
}
