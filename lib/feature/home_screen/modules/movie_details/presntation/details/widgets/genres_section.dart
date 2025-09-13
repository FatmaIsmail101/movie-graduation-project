import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/movie_details_response.dart';

class GenresSection extends StatelessWidget {
  final Movie? movie;

  const GenresSection({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    final genres = movie?.genres ?? [];

    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Genres",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          if (genres.isNotEmpty)
            Wrap(
              spacing: 8,
              children: genres.map((g) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF282A28),
                    borderRadius: BorderRadius.circular(16.w),
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
