import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/datasource/movie_details_remote_ds.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/domain/repo/movie_details_repo.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  MovieDetailsRemoteDS movieDetailsRemoteDS;

  MovieDetailsRepoImpl(this.movieDetailsRemoteDS);

  @override
  Future<Either<MovieFailure, MovieDetailsResponse>> call(
    int movieId, {
    bool withImages = true,
    bool withCast = true,
  }) async {
    try {
      print("RepoDSImpl: movie id : $movieId");
      final response = await movieDetailsRemoteDS.getMovieDetailsDS(
        movieId,
        withImages: withImages,
        withCast: withCast,
      );
      print("response for id $movieId");
      return Right(response);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
