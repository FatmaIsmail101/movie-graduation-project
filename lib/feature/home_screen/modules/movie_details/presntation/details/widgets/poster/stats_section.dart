import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';

class StatsSection extends StatelessWidget {
  StatsSection({super.key, this.movie});

  Movie? movie;

  @override
  Widget build(BuildContext context) {
    final stats = [
      {"icon": Icons.favorite, "value": "${movie?.likeCount ?? 0}"},
      {"icon": Icons.access_time_rounded, "value": "${movie?.runtime ?? 0}"},
      {"icon": Icons.star, "value": "${movie?.rating ?? 0}"},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: stats.map((s) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Icon(s["icon"] as IconData, color: Colors.yellow, size: 15),
                const SizedBox(width: 10),
                Text(
                  s["value"] as String,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
