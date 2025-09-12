part of 'update_profile_bloc.dart';

class UpdateProfileState {
  final RequestState? updateRequestState;
  final UpdateModelResponse? updateModelResponse;
  final MovieFailure? failure;

  UpdateProfileState({
    this.updateRequestState,
    this.updateModelResponse,
    this.failure,
  });

  UpdateProfileState copyWith({
    RequestState? updateRequestState,
    UpdateModelResponse? updateModelResponse,
    MovieFailure? failure,
  }) {
    return UpdateProfileState(
      updateRequestState: updateRequestState ?? this.updateRequestState,
      updateModelResponse: updateModelResponse ?? this.updateModelResponse,
      failure: failure ?? this.failure,
    );
  }
}

class UpdateProfileInitial extends UpdateProfileState {
  UpdateProfileInitial() : super(updateRequestState: RequestState.init);
}

enum RequestState { init, loading, success, error }
