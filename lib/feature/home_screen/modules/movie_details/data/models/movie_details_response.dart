import 'package:json_annotation/json_annotation.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  final String status;
  @JsonKey(name: "status_message")
  final String statusMessage;
  final DataWrapper data;

  MovieDetailsResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}

@JsonSerializable()
class DataWrapper {
  final Movie movie;

  DataWrapper({required this.movie});

  factory DataWrapper.fromJson(Map<String, dynamic> json) =>
      _$DataWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$DataWrapperToJson(this);
}

@JsonSerializable()
class Movie {
  final int id;
  final String url;

  @JsonKey(name: "imdb_code")
  final String imdbCode;

  final String title;

  @JsonKey(name: "title_english")
  final String titleEnglish;

  @JsonKey(name: "title_long")
  final String titleLong;

  final String slug;

  @JsonKey(defaultValue: 0)
  final int year;

  @JsonKey(defaultValue: 0.0)
  final double rating;

  @JsonKey(defaultValue: 0)
  final int runtime;

  final List<String>? genres;

  @JsonKey(name: "like_count", defaultValue: 0)
  final int likeCount;

  @JsonKey(name: "description_intro", defaultValue: "")
  final String descriptionIntro;

  @JsonKey(name: "description_full", defaultValue: "")
  final String descriptionFull;

  @JsonKey(name: "yt_trailer_code", defaultValue: "")
  final String ytTrailerCode;

  @JsonKey(defaultValue: "en")
  final String language;

  @JsonKey(name: "mpa_rating", defaultValue: "")
  final String mpaRating;

  @JsonKey(name: "background_image", defaultValue: "")
  final String backgroundImage;

  @JsonKey(name: "background_image_original", defaultValue: "")
  final String backgroundImageOriginal;

  @JsonKey(name: "small_cover_image", defaultValue: "")
  final String smallCoverImage;

  @JsonKey(name: "medium_cover_image", defaultValue: "")
  final String mediumCoverImage;

  @JsonKey(name: "large_cover_image", defaultValue: "")
  final String largeCoverImage;

  // ✅ screenshots nullable
  @JsonKey(name: "medium_screenshot_image1")
  final String? mediumScreenshot1;

  @JsonKey(name: "medium_screenshot_image2")
  final String? mediumScreenshot2;

  @JsonKey(name: "medium_screenshot_image3")
  final String? mediumScreenshot3;

  @JsonKey(name: "large_screenshot_image1")
  final String? largeScreenshot1;

  @JsonKey(name: "large_screenshot_image2")
  final String? largeScreenshot2;

  @JsonKey(name: "large_screenshot_image3")
  final String? largeScreenshot3;

  final List<Cast>? cast;

  final List<Torrent> torrents;

  @JsonKey(name: "date_uploaded", defaultValue: "")
  final String dateUploaded;

  @JsonKey(name: "date_uploaded_unix", defaultValue: 0)
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
    this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    this.mediumScreenshot1,
    this.mediumScreenshot2,
    this.mediumScreenshot3,
    this.largeScreenshot1,
    this.largeScreenshot2,
    this.largeScreenshot3,
    this.cast,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Cast {
  final String name;
  @JsonKey(name: "character_name")
  final String characterName;
  @JsonKey(name: "url_small_image")
  final String? imageUrl;
  @JsonKey(name: "imdb_code")
  final String imdbCode;

  Cast({
    required this.name,
    required this.characterName,
    this.imageUrl,
    required this.imdbCode,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Torrent {
  final String url;
  final String hash;
  final String quality;
  final String type;
  @JsonKey(name: "is_repack")
  final String isRepack;
  @JsonKey(name: "video_codec")
  final String videoCodec;
  @JsonKey(name: "bit_depth")
  final String bitDepth;
  @JsonKey(name: "audio_channels")
  final String audioChannels;
  final int seeds;
  final int peers;
  final String size;
  @JsonKey(name: "size_bytes")
  final int sizeBytes;
  @JsonKey(name: "date_uploaded")
  final String dateUploaded;
  @JsonKey(name: "date_uploaded_unix")
  final int dateUploadedUnix;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
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
