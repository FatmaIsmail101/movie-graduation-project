import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/movie_details_response.dart';

class ScreenshotsSection extends StatelessWidget {
  ScreenshotsSection({super.key, this.movie});

  Movie? movie;

  @override
  Widget build(BuildContext context) {
    final screenshots = [
      movie?.mediumScreenshot1 ?? "",
      movie?.mediumScreenshot2 ?? '',
      movie?.mediumScreenshot3 ?? '',
    ].whereType<String>().toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Screen Shots",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 600.h,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: screenshots.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child:
                      movie?.mediumScreenshot1 != null &&
                          movie!.mediumScreenshot1!.isNotEmpty
                      ? Image.network(
                          screenshots[index],
                          width: double.infinity,
                          height: 180.h,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
