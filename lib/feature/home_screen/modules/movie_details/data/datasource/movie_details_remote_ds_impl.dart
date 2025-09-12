import 'package:injectable/injectable.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/network/movie_details_api.dart';

import 'movie_details_remote_ds.dart';

@Injectable(as: MovieDetailsRemoteDS)
class MovieDetailsRemoteDsImpl implements MovieDetailsRemoteDS {
  @override
  Future<MovieDetailsResponse> getMovieDetailsDS(
    int movieId, {
    bool withImages = true,
    bool withCast = true,
  }) async {
    // TODO: implement getMovieDetailsDS
    print("RemoteDSImpl: $movieId");
    final response = await getIt<MovieDetailsApi>().getMovieDetails(
      movieId,
      withImages,
      withCast,
    );
    print("response${response.data.movie.id}");
    return response;
  }
}
