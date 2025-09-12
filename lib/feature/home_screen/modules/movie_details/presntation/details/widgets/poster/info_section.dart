import 'package:flutter/material.dart';

import '../../../../data/models/movie_details_response.dart';

class InfoSection extends StatelessWidget {
  InfoSection({super.key, this.movie});

  Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            movie?.title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text("${movie?.year ?? ""}", style: TextStyle(color: Colors.white)),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
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
