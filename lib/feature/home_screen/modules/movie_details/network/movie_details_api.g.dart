// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_api.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _MovieDetailsApi implements MovieDetailsApi {
  _MovieDetailsApi(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://yts.mx/api/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<MovieDetailsResponse> getMovieDetails(int movieId,
      bool withImages,
      bool withCast,) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'movie_id': movieId,
      r'with_images': withImages,
      r'with_cast': withCast,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<MovieDetailsResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
        _dio.options,
        'movie_details.json',
        queryParameters: queryParameters,
        data: _data,
      )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MovieDetailsResponse _value;
    try {
      _value = MovieDetailsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SuggestionModelResponse> getMovieSuggestions(int movieId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'movie_id': movieId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<SuggestionModelResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
        _dio.options,
        'movie_suggestions.json',
        queryParameters: queryParameters,
        data: _data,
      )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SuggestionModelResponse _value;
    try {
      _value = SuggestionModelResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MovieListResponse> getMovieList(int limit,
      int page,
      String? quality,
      int minimumRating,
      String? queryTerm,
      String? genre,
      String sortBy,
      String orderBy,
      bool withRtRatings,) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'page': page,
      r'quality': quality,
      r'minimum_rating': minimumRating,
      r'query_term': queryTerm,
      r'genre': genre,
      r'sort_by': sortBy,
      r'order_by': orderBy,
      r'with_rt_ratings': withRtRatings,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<MovieListResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
        _dio.options,
        'list_movies.json',
        queryParameters: queryParameters,
        data: _data,
      )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MovieListResponse _value;
    try {
      _value = MovieListResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl
        .trim()
        .isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
