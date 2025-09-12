import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/domain/usecase/movie_details_usecases.dart';

import '../../../../../../core/error_handling/falliures.dart';
import '../../../../../authuntication/presentation/bloc/login_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsUseCase movieDetailsUseCase;

  MovieDetailsBloc(this.movieDetailsUseCase) : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      print("Bloc recevied GetMovieDetailswith movieId=${event.movieId}");
      emit(state.copyWith(movieDetailsRequestState: RequestState.loading));
      var result = await movieDetailsUseCase.call(
        event.movieId,
        withImages: event.withImages,
        withCast: event.withCast,
      );
      result.fold(
        (l) {
          print("Bloc failed with error=${l.message}");

          return emit(
            state.copyWith(
              movieDetailsRequestState: RequestState.error,
              failure: l,
            ),
          );
        },
        (r) {
          print("Bloc success movie title=${r.data.movie.title}");

          return emit(
            state.copyWith(
              movieDetailsRequestState: RequestState.success,
              movieDetailsModelResponse: r,
            ),
          );
        },
      );
    });
  }
}
