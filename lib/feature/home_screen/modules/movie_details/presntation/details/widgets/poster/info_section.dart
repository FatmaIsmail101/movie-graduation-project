import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/movie_details_response.dart';

class InfoSection extends StatelessWidget {
  InfoSection({super.key, this.movie});

  Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.r),
      child: Column(
        children: [
          Text(
            movie?.title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.h),
          Text("${movie?.year ?? ""}", style: TextStyle(color: Colors.white)),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Watch", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
