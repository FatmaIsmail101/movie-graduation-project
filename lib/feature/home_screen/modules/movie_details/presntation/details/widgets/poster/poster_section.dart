import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/movie_details_response.dart';

class PosterSection extends StatelessWidget {
  const PosterSection({super.key, this.movie});

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          movie?.largeCoverImage ?? '',
          width: double.infinity,
          height: 300.h,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x12131233), Color(0xFF121312)],
              stops: [0.2, 1.0],
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: Icon(Icons.bookmark, color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          child: Center(
            child: CircleAvatar(
              radius: 42,
              backgroundColor: Colors.amber,
              child: CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 31,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.play_arrow, size: 40, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
