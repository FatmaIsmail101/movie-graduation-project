import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:movies/feature/authuntication/presentation/bloc/login_bloc.dart';
import 'package:movies/feature/home_screen/modules/home/presentaion/bloc/movie_list_bloc.dart';
import 'package:movies/feature/home_screen/modules/home/presentaion/view/widgets/moive_card.dart';

import '../../../movie_details/presntation/details/movie_details_page.dart';


class SeeMoreScreen extends StatefulWidget {
  final String genre;

  const SeeMoreScreen({super.key, required this.genre});

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    context.read<MovieListBloc>().add(
      GetMovieListEvent(genre: widget.genre, page: currentPage),
    );

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        currentPage++;
        context.read<MovieListBloc>().add(
          GetMovieListEvent(genre: widget.genre,
            page: currentPage,),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.genre),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state.movieListRequestState == RequestState.loading &&
              (state.movieListModelResponse?.data.movies.isEmpty ?? true)) {
            return Center(child: CircularProgressIndicator());
          } else if (state.movieListRequestState == RequestState.success) {
            final movies = state.movieListModelResponse?.data.movies ?? [];
            return GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              itemCount: movies.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                if (index < movies.length) {
                  return Bounceable(onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) =>
                          MovieDetailsPage(
                              movieId: movies[index].id),
                    ),);
                  },
                      child: MovieCard(movie: movies[index]));
                } else {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          } else if (state.movieListRequestState == RequestState.error) {
            return Center(
              child: Text(state.failure?.message ?? "No More Movies",
                  style: TextStyle(color: Colors.red)),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
