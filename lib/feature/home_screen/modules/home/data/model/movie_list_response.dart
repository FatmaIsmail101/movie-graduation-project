import 'package:json_annotation/json_annotation.dart';

import '../../../movie_details/data/models/movie_details_response.dart';

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  final String status;
  @JsonKey(name: "status_message")
  final String statusMessage;
  final MovieListData data;

  MovieListResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}

@JsonSerializable()
class MovieListData {
  @JsonKey(name: "movie_count")
  final int movieCount;
  final int limit;
  @JsonKey(name: "page_number")
  final int pageNumber;
  final List<Movie> movies;

  MovieListData({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory MovieListData.fromJson(Map<String, dynamic> json) =>
      _$MovieListDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListDataToJson(this);
}
