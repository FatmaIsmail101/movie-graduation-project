import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/assets.dart';
import '../bloc/bloc.dart';
import '../bloc/movies_event.dart';
import '../bloc/movies_state.dart';
import '../repository/movies_repository.dart';
import 'widgets/movie_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final genres = ["Action", "Comedy", "Drama", "Romance", "Thriller"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            BlocProvider(
              create: (_) =>
                  MoviesBloc(MoviesRepository())..add(LoadMoviesEvent("all")),
              child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoading || state is MoviesInitial) {
                    return SizedBox(
                      height: 500,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is MoviesLoaded && state.movies.isNotEmpty) {
                    final movies = state.movies.take(5).toList();

                    return SizedBox(
                      height: 580,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              movies[currentIndex].largeCoverImage ??
                                  movies[currentIndex].mediumCoverImage ??
                                  "",
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  Container(color: Colors.black),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.9),
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            child: Image.asset(
                              AppAssets.availableNowImg,
                              height: 90,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 100),
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 340,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  viewportFraction: 0.65,
                                  onPageChanged: (index, reason) {
                                    setState(() => currentIndex = index);
                                  },
                                ),
                                items: movies.map((movie) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      movie.mediumCoverImage ?? "",
                                      height: 340,
                                      width: 220,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.broken_image,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                AppAssets.watchNowImg,
                                height: 100,
                                width: 380,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else if (state is MoviesError) {
                    return SizedBox(
                      height: 300,
                      child: Center(
                        child: Text(
                          "Error: ${state.message}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
                  return SizedBox(height: 300);
                },
              ),
            ),
            ...genres.map((genre) {
              return BlocProvider(
                create: (_) =>
                    MoviesBloc(MoviesRepository())..add(LoadMoviesEvent(genre)),
                child: BlocBuilder<MoviesBloc, MoviesState>(
                  builder: (context, state) {
                    if (state is MoviesLoading || state is MoviesInitial) {
                      return SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is MoviesLoaded) {
                      return MovieSection(title: genre, movies: state.movies);
                    } else if (state is MoviesError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return SizedBox(height: 200);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
