import 'package:injectable/injectable.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/feature/home_screen/modules/home/data/datasource/movie_list_remote_ds.dart';
import 'package:movies/feature/home_screen/modules/home/data/model/movie_list_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/network/movie_details_api.dart';

@Injectable(as: MovieListRemoteDs)
class MovieListRemoteDSImpl implements MovieListRemoteDs {
  @override
  Future<MovieListResponse> getMovieListDS({
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
    print("LimitRemoteDSImpl: $limit");
    final response = await getIt<MovieDetailsApi>().getMovieList(
      limit,
      page,
      quality,
      minimumRating,
      queryTerm,
      genre,
      sortBy,
      orderBy,
      withRtRatings,
    );
    print("response${response.data.limit}");
    return response;
  }
}
