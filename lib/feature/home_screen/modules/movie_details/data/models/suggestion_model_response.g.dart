// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionModelResponse _$SuggestionModelResponseFromJson(
  Map<String, dynamic> json,
) => SuggestionModelResponse(
  status: json['status'] as String,
  statusMessage: json['status_message'] as String,
  data: SuggestionData.fromJson(json['data'] as Map<String, dynamic>),
  meta: Meta.fromJson(json['@meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SuggestionModelResponseToJson(
  SuggestionModelResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'status_message': instance.statusMessage,
  'data': instance.data.toJson(),
  '@meta': instance.meta.toJson(),
};

SuggestionData _$SuggestionDataFromJson(Map<String, dynamic> json) =>
    SuggestionData(
      movieCount: (json['movie_count'] as num).toInt(),
      movies: (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestionDataToJson(SuggestionData instance) =>
    <String, dynamic>{
      'movie_count': instance.movieCount,
      'movies': instance.movies.map((e) => e.toJson()).toList(),
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: (json['id'] as num).toInt(),
  url: json['url'] as String,
  imdbCode: json['imdb_code'] as String,
  title: json['title'] as String,
  titleEnglish: json['title_english'] as String,
  titleLong: json['title_long'] as String,
  slug: json['slug'] as String,
  year: (json['year'] as num).toInt(),
  rating: (json['rating'] as num).toDouble(),
  runtime: (json['runtime'] as num).toInt(),
  genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
  summary: json['summary'] as String,
  descriptionFull: json['description_full'] as String,
  synopsis: json['synopsis'] as String,
  ytTrailerCode: json['yt_trailer_code'] as String,
  language: json['language'] as String,
  mpaRating: json['mpa_rating'] as String,
  backgroundImage: json['background_image'] as String,
  backgroundImageOriginal: json['background_image_original'] as String,
  smallCoverImage: json['small_cover_image'] as String,
  mediumCoverImage: json['medium_cover_image'] as String,
  state: json['state'] as String,
  torrents: (json['torrents'] as List<dynamic>)
      .map((e) => Torrent.fromJson(e as Map<String, dynamic>))
      .toList(),
  dateUploaded: json['date_uploaded'] as String,
  dateUploadedUnix: (json['date_uploaded_unix'] as num).toInt(),
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'imdb_code': instance.imdbCode,
  'title': instance.title,
  'title_english': instance.titleEnglish,
  'title_long': instance.titleLong,
  'slug': instance.slug,
  'year': instance.year,
  'rating': instance.rating,
  'runtime': instance.runtime,
  'genres': instance.genres,
  'summary': instance.summary,
  'description_full': instance.descriptionFull,
  'synopsis': instance.synopsis,
  'yt_trailer_code': instance.ytTrailerCode,
  'language': instance.language,
  'mpa_rating': instance.mpaRating,
  'background_image': instance.backgroundImage,
  'background_image_original': instance.backgroundImageOriginal,
  'small_cover_image': instance.smallCoverImage,
  'medium_cover_image': instance.mediumCoverImage,
  'state': instance.state,
  'torrents': instance.torrents.map((e) => e.toJson()).toList(),
  'date_uploaded': instance.dateUploaded,
  'date_uploaded_unix': instance.dateUploadedUnix,
};

Torrent _$TorrentFromJson(Map<String, dynamic> json) => Torrent(
  url: json['url'] as String,
  hash: json['hash'] as String,
  quality: json['quality'] as String,
  isRepack: json['is_repack'] as String,
  videoCodec: json['video_codec'] as String,
  bitDepth: json['bit_depth'] as String,
  audioChannels: json['audio_channels'] as String,
  seeds: (json['seeds'] as num).toInt(),
  peers: (json['peers'] as num).toInt(),
  size: json['size'] as String,
  sizeBytes: (json['size_bytes'] as num).toInt(),
  dateUploaded: json['date_uploaded'] as String,
  dateUploadedUnix: (json['date_uploaded_unix'] as num).toInt(),
);

Map<String, dynamic> _$TorrentToJson(Torrent instance) => <String, dynamic>{
  'url': instance.url,
  'hash': instance.hash,
  'quality': instance.quality,
  'is_repack': instance.isRepack,
  'video_codec': instance.videoCodec,
  'bit_depth': instance.bitDepth,
  'audio_channels': instance.audioChannels,
  'seeds': instance.seeds,
  'peers': instance.peers,
  'size': instance.size,
  'size_bytes': instance.sizeBytes,
  'date_uploaded': instance.dateUploaded,
  'date_uploaded_unix': instance.dateUploadedUnix,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  serverTime: (json['server_time'] as num).toInt(),
  serverTimezone: json['server_timezone'] as String,
  apiVersion: (json['api_version'] as num).toInt(),
  executionTime: json['execution_time'] as String,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'server_time': instance.serverTime,
  'server_timezone': instance.serverTimezone,
  'api_version': instance.apiVersion,
  'execution_time': instance.executionTime,
};
