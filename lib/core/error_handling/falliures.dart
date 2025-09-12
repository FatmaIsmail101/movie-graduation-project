abstract class MovieFailure {
  String? message;

  MovieFailure({this.message = ''});

  @override
  String toString() => message ?? 'Unknown failure';
}

class GeneralFailure extends MovieFailure {
  GeneralFailure({super.message});
}
