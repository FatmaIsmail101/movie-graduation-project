import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../data/models/movie_details_response.dart';

class PosterSection extends StatefulWidget {
  final Movie? movie;
  const PosterSection({super.key, this.movie});

  @override
  State<PosterSection> createState() => _PosterSectionState();
}

class _PosterSectionState extends State<PosterSection> {
  VideoPlayerController? _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb && widget.movie != null && widget.movie!.torrents.isNotEmpty) {
      _controller = VideoPlayerController.network(widget.movie!.torrents[0].url)
        ..initialize().then((_) {
          setState(() {}); // إعادة build بعد التحميل
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_controller == null) return;
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
        _isPlaying = false;
      } else {
        _controller!.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final poster = widget.movie?.largeCoverImage ?? '';

    return Stack(
      children: [
        // لو Web أو مفيش فيديو => Poster Image
        if (kIsWeb || _controller == null || !_controller!.value.isInitialized)
          Image.network(
            poster,
            width: double.infinity,
            height: 300.h,
            fit: BoxFit.cover,
          )
        else
          SizedBox(
            width: double.infinity,
            height: 300.h,
            child: VideoPlayer(_controller!),
          ),

        // Gradient overlay
        Container(
          width: double.infinity,
          height: 300.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x12131233), Color(0xFF121312)],
              stops: [0.2, 1.0],
            ),
          ),
        ),

        // Back & Bookmark Icons
        Positioned(
          top: 20.h,
          left: 10.w,
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        Positioned(
          top: 20.h,
          right: 10.w,
          child: Icon(Icons.bookmark, color: Colors.white),
        ),

        // Play button
        if (!kIsWeb)
          Positioned.fill(
            child: Center(
              child: GestureDetector(
                onTap: _togglePlay,
                child: CircleAvatar(
                  radius: 42.r,
                  backgroundColor: Colors.amber,
                  child: CircleAvatar(
                    radius: 38.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 31.r,
                      backgroundColor: Colors.amber,
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 40.sw,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}