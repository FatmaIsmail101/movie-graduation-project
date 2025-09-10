import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/movie_model.dart';

class MoviesRepository {
  Future<List<MovieModel>> getMovies({int page = 1, String genre = ""}) async {
    final url = Uri.parse(
      "https://yts.mx/api/v2/list_movies.json?page=$page&limit=20${genre.isNotEmpty ? "&genre=$genre" : ""}",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final moviesJson = data["data"]["movies"] as List<dynamic>?;

      if (moviesJson == null) return [];

      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
