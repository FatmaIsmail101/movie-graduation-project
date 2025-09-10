import 'package:equatable/equatable.dart';

import '../model/movie_model.dart';

abstract class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MovieModel> movies;
  final bool hasMore;

  MoviesLoaded(this.movies, {this.hasMore = true});

  @override
  List<Object?> get props => [movies, hasMore];
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
