import 'package:flutter/material.dart';

import '../../model/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.network(
            movie.mediumCoverImage ?? "",
            fit: BoxFit.cover,
            width: 120,
            height: 180,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey, width: 120, height: 180),
          ),
          if (movie.rating != null)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.amber),
                    SizedBox(width: 2),
                    Text(
                      movie.rating!.toStringAsFixed(1),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
