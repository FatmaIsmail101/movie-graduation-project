// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) =>
    MovieListResponse(
      status: json['status'] as String,
      statusMessage: json['status_message'] as String,
      data: MovieListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.statusMessage,
      'data': instance.data,
    };

MovieListData _$MovieListDataFromJson(Map<String, dynamic> json) =>
    MovieListData(
      movieCount: (json['movie_count'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      pageNumber: (json['page_number'] as num).toInt(),
      movies: (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieListDataToJson(MovieListData instance) =>
    <String, dynamic>{
      'movie_count': instance.movieCount,
      'limit': instance.limit,
      'page_number': instance.pageNumber,
      'movies': instance.movies,
    };
