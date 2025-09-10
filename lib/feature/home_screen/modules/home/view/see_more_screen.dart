import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature/home_screen/modules/home/view/widgets/moive_card.dart';

import '../bloc/bloc.dart';
import '../bloc/movies_event.dart';
import '../bloc/movies_state.dart';

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
    context.read<MoviesBloc>().add(
      LoadMoviesEvent(widget.genre, page: currentPage),
    );

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        currentPage++;
        context.read<MoviesBloc>().add(
          LoadMoviesEvent(widget.genre, page: currentPage, isLoadMore: true),
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
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading && state is! MoviesLoaded) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MoviesLoaded) {
            final movies = state.movies;
            return GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              itemCount: movies.length + (state.hasMore ? 1 : 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                if (index < movies.length) {
                  return MovieCard(movie: movies[index]);
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
          } else if (state is MoviesError) {
            return Center(
              child: Text(state.message, style: TextStyle(color: Colors.red)),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
