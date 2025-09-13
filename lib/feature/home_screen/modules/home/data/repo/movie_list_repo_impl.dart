import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/home_screen/modules/home/data/datasource/movie_list_remote_ds.dart';
import 'package:movies/feature/home_screen/modules/home/data/model/movie_list_response.dart';
import 'package:movies/feature/home_screen/modules/home/domain/repo/movie_list_repo.dart';

@Injectable(as: MovieListRepo)
class MovieListRepoImpl implements MovieListRepo {
  MovieListRemoteDs movieListRemoteDs;

  MovieListRepoImpl(this.movieListRemoteDs);

  @override
  Future<Either<MovieFailure, MovieListResponse>> getMovieList({
    int limit = 20,
    int page = 1,
    String? quality,
    int minimumRating = 0,
    String? queryTerm,
    String? genre,
    String sortBy = "date_added",
    String orderBy = "desc",
    bool withRtRatings = false,
  }) async {
    try {
      print("RepoDSImpl: movie limit : $limit");
      final response = await movieListRemoteDs.getMovieListDS(
        limit: limit,
        genre: genre,
        minimumRating: minimumRating,
        orderBy: orderBy,
        page: page,
        quality: quality,
        queryTerm: queryTerm,
        sortBy: sortBy,
        withRtRatings: withRtRatings,
      );
      print("response for limit $limit");
      return Right(response);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
