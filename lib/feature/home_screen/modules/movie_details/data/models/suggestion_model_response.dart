import 'package:json_annotation/json_annotation.dart';

part 'suggestion_model_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SuggestionModelResponse {
  final String status;
  @JsonKey(name: 'status_message')
  final String statusMessage;
  final SuggestionData data;
  @JsonKey(name: '@meta')
  final Meta meta;

  SuggestionModelResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  factory SuggestionModelResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestionModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionModelResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SuggestionData {
  @JsonKey(name: 'movie_count')
  final int movieCount;
  final List<Movie> movies;

  SuggestionData({required this.movieCount, required this.movies});

  factory SuggestionData.fromJson(Map<String, dynamic> json) =>
      _$SuggestionDataFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Movie {
  final int id;
  final String url;
  @JsonKey(name: 'imdb_code')
  final String imdbCode;
  final String title;
  @JsonKey(name: 'title_english')
  final String titleEnglish;
  @JsonKey(name: 'title_long')
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String summary;
  @JsonKey(name: 'description_full')
  final String descriptionFull;
  final String synopsis;
  @JsonKey(name: 'yt_trailer_code')
  final String ytTrailerCode;
  final String language;
  @JsonKey(name: 'mpa_rating')
  final String mpaRating;
  @JsonKey(name: 'background_image')
  final String backgroundImage;
  @JsonKey(name: 'background_image_original')
  final String backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
  final String smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
  final String mediumCoverImage;
  final String state;
  final List<Torrent> torrents;
  @JsonKey(name: 'date_uploaded')
  final String dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int dateUploadedUnix;

  Movie({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.state,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Torrent {
  final String url;
  final String hash;
  final String quality;
  @JsonKey(name: 'is_repack')
  final String isRepack;
  @JsonKey(name: 'video_codec')
  final String videoCodec;
  @JsonKey(name: 'bit_depth')
  final String bitDepth;
  @JsonKey(name: 'audio_channels')
  final String audioChannels;
  final int seeds;
  final int peers;
  final String size;
  @JsonKey(name: 'size_bytes')
  final int sizeBytes;
  @JsonKey(name: 'date_uploaded')
  final String dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int dateUploadedUnix;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);

  Map<String, dynamic> toJson() => _$TorrentToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'server_time')
  final int serverTime;
  @JsonKey(name: 'server_timezone')
  final String serverTimezone;
  @JsonKey(name: 'api_version')
  final int apiVersion;
  @JsonKey(name: 'execution_time')
  final String executionTime;

  Meta({
    required this.serverTime,
    required this.serverTimezone,
    required this.apiVersion,
    required this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
