import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';

import 'cast_item.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key, this.movie});

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final castList = movie?.cast ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (castList.isNotEmpty)
          ...castList.map(
            (actor) => CastItem(
              imagePath:
                  actor.imageUrl ?? "", // صورة بديلة لو الـ API مرجعش صورة
              name: "Name : ${actor.name}",
              role: "Character : ${actor.characterName}",
            ),
          )
        else
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
              "No cast available",
              style: TextStyle(color: Colors.white70),
            ),
          ),
      ],
    );
  }
}
