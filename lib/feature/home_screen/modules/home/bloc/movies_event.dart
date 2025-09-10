import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMoviesEvent extends MoviesEvent {
  final String genre;
  final int page;
  final bool isLoadMore;

  LoadMoviesEvent(this.genre, {this.page = 1, this.isLoadMore = false});

  @override
  List<Object?> get props => [genre, page, isLoadMore];
}
