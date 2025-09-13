import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/movie_details_response.dart';

class SummarySection extends StatelessWidget {
  SummarySection({super.key, this.movie});

  Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Summary",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            movie?.descriptionIntro ?? '',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
