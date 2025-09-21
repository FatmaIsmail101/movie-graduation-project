import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/feature/home_screen/modules/home/presentaion/bloc/movie_list_bloc.dart';

import '../../../../../../core/constants/assets.dart';
import '../../../../../authuntication/presentation/bloc/login_bloc.dart';
import '../../../movie_details/presntation/details/movie_details_page.dart';
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
              create: (BuildContext context) =>
              getIt<MovieListBloc>()
                ..add(GetMovieListEvent()),
              child: BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, state) {
                  if (state.movieListRequestState == RequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else
                  if (state.movieListRequestState == RequestState.success) {
                    final movies = state.movieListModelResponse?.data.movies ??
                        [];
                    print(state.movieListModelResponse?.toJson());
                    if (movies.isEmpty) {
                      return const Center(
                        child: Text("No movies Found", style: TextStyle(
                            color: Colors.white
                        ),),);
                    }
                    return SizedBox(
                      height: 580.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              movies[currentIndex].largeCoverImage
                              ,
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
                              SizedBox(height: 75.h),
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
                                  return Bounceable(

                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (_) =>
                                            MovieDetailsPage(
                                                movieId: movie.id),
                                      ),);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        movie.mediumCoverImage ?? "",
                                        height: 340.h,
                                        width: 220.w,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                        const Icon(
                                          Icons.broken_image,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                AppAssets.watchNowImg,
                                height: 100.h,
                                width: 380.w,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else
                  if (state.movieListRequestState == RequestState.error) {
                    return Center(child: Text("Error: ${state.failure
                        ?.message}"));
                  }
                  return SizedBox(height: 300.h);
                },
              ),
            ),
            ...genres.map((genre) {
              return BlocProvider(
                create: (BuildContext context) =>
                getIt<MovieListBloc>()
                  ..add(GetMovieListEvent(genre: genre)),
                child: BlocBuilder<MovieListBloc, MovieListState>(
                  builder: (context, state) {
                    if (state.movieListRequestState == RequestState.loading) {
                      return SizedBox(height: 200.h,
                          child: const Center(
                              child: CircularProgressIndicator()));
                    }
                    else
                    if (state.movieListRequestState == RequestState.success) {
                      final movies = state.movieListModelResponse?.data
                          .movies ?? [];
                      print(state.movieListModelResponse?.toJson());
                      if (movies.isEmpty) {
                        return SizedBox(height: 200.h,
                          child: const Center(
                            child: Text("No movies Found", style: TextStyle(
                                color: Colors.white
                            ),),),
                        );
                      }

                      return MovieSection(title: genre, movies: movies);
                    } else
                    if (state.movieListRequestState == RequestState.error) {
                      return SizedBox(
                        height: 200.h,
                        child: Center(
                          child: Text(
                            state.failure?.message ?? "Error Loading Movies",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                    return SizedBox(height: 200.h);
                  }
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
