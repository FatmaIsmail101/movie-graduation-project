import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/home_screen/modules/home/data/model/movie_list_response.dart';
import 'package:movies/feature/home_screen/modules/home/domain/repo/movie_list_repo.dart';

@injectable
class MovieListUseCases {
  MovieListRepo movieListRepo;

  MovieListUseCases(this.movieListRepo);

  Future<Either<MovieFailure, MovieListResponse>> getMovieListUseCases({
    int limit = 20,
    int page = 1,
    String? quality,
    int minimumRating = 0,
    String? queryTerm,
    String? genre,
    String sortBy = "date_added",
    String orderBy = "desc",
    bool withRtRatings = false,
  }) {
    return movieListRepo.getMovieList(
      withRtRatings: withRtRatings,
      sortBy: sortBy,
      queryTerm: queryTerm,
      quality: quality,
      page: page,
      orderBy: orderBy,
      minimumRating: minimumRating,
      genre: genre,
      limit: limit,
    );
  }
}
