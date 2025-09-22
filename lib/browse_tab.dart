import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BrowseTab extends StatefulWidget {
  const BrowseTab({Key? key}) : super(key: key);

  @override
  State<BrowseTab> createState() => _BrowseTapState();
}

class _BrowseTapState extends State<BrowseTab> {
  final Color yellow = const Color(0xFFF6BD00);

  List movies = [];
  Set<String> genres = {};
  String selectedGenre = "";

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    setState(() => isLoading = true);
    try {
      final url = Uri.parse('https://yts.mx/api/v2/list_movies.json?limit=50');
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      movies = data['data']['movies'] ?? [];
      genres.clear();

      for (var movie in movies) {
        if (movie['genres'] != null) {
          genres.addAll(List<String>.from(movie['genres']));
        }
      }

      if (genres.isNotEmpty && selectedGenre.isEmpty) {
        selectedGenre = genres.first;
      }
    } catch (e) {
      print("Error: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121312),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: yellow))
            : Column(
          children: [
            // Tabs
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                children: genres.map((genre) {
                  final bool isSelected = genre == selectedGenre;
                  return GestureDetector(
                    onTap: () => setState(() => selectedGenre = genre),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? yellow : Colors.transparent,
                        border: Border.all(color: yellow, width: 2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Text(
                        genre,
                        style: TextStyle(
                          color: isSelected ? Colors.black : yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Movies grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.68,
                  children: movies
                      .where((movie) => (movie['genres'] ?? []).contains(selectedGenre))
                      .map((movie) {
                    return MovieCard(
                      imageUrl: movie['medium_cover_image'],
                      title: movie['title'],
                      rating: movie['rating']?.toString() ?? "0",
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;

  const MovieCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color yellow = const Color(0xFFF6BD00);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 180,
                color: Colors.black12,
                alignment: Alignment.center,
                child: Icon(Icons.broken_image, color: yellow, size: 40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              children: [
                Text(
                  rating,
                  style: TextStyle(
                      color: yellow, fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Icon(Icons.star, color: yellow, size: 18),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.1,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
