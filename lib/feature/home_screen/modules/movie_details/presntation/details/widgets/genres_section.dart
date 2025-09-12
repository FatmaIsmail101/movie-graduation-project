import 'package:flutter/material.dart';

import '../../../data/models/movie_details_response.dart';

class GenresSection extends StatelessWidget {
  final Movie? movie;

  const GenresSection({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    final genres = movie?.genres ?? [];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Genres",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          if (genres.isNotEmpty)
            Wrap(
              spacing: 8,
              children: genres.map((g) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF282A28),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(g, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
            )
          else
            const Text(
              "No genres available",
              style: TextStyle(color: Colors.white70),
            ),
        ],
      ),
    );
  }
}
