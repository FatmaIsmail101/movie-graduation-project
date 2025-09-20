part of 'update_profile_bloc.dart';

class UpdateProfileState {
  final RequestState? updateRequestState;
  final UpdateModelResponse? updateModelResponse;
  final MovieFailure? failure;
  final RequestState? deleteRequestState;
  final MovieFailure? deletefailure;

  UpdateProfileState({
    this.updateRequestState,
    this.updateModelResponse,
    this.failure,
    this.deleteRequestState, this.deletefailure
  });

  UpdateProfileState copyWith({
    RequestState? updateRequestState,
    UpdateModelResponse? updateModelResponse,
    MovieFailure? failure,
    RequestState? deleteRequestState,
    MovieFailure? deletefailure,

  }) {
    return UpdateProfileState(
      updateRequestState: updateRequestState ?? this.updateRequestState,
      updateModelResponse: updateModelResponse ?? this.updateModelResponse,
      failure: failure ?? this.failure,
      deleteRequestState: deleteRequestState ?? this.deleteRequestState,
      deletefailure: deletefailure ?? this.deletefailure,


    );
  }
}

class UpdateProfileInitial extends UpdateProfileState {
  UpdateProfileInitial() : super(updateRequestState: RequestState.init);
}

enum RequestState { init, loading, success, error }
