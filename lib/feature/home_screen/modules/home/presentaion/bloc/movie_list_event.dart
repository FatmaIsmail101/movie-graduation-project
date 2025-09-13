part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object?> get props => [];
}

/// Event عشان نجيب تفاصيل فيلم
class GetMovieListEvent extends MovieListEvent {
  int limit;
  int page;
  String? quality;
  int minimumRating;
  String? queryTerm;
  String? genre;
  String sortBy;
  String orderBy;
  bool withRtRatings;

  GetMovieListEvent({
    this.limit = 20,
    this.page = 1,
    this.quality,
    this.minimumRating = 0,
    this.queryTerm,
    this.genre,
    this.sortBy = "date_added",
    this.orderBy = "desc",
    this.withRtRatings = false,
  });

  @override
  List<Object?> get props => [
    limit,
    page,
    quality,
    minimumRating,
    queryTerm,
    genre,
    sortBy,
    orderBy,
    withRtRatings,
  ];
}
