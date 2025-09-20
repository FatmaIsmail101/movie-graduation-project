import '../../../../core/error_handling/falliures.dart';
import '../../../authuntication/presentation/bloc/login_bloc.dart';

class DeleteProfileState {
  final RequestState? deleteRequestState;
  final MovieFailure? failure;

  DeleteProfileState({this.deleteRequestState, this.failure});

  DeleteProfileState copyWith({
    RequestState? deleteRequestState,

    MovieFailure? failure,
  }) {
    return DeleteProfileState(
      deleteRequestState: deleteRequestState ?? this.deleteRequestState,

      failure: failure ?? this.failure,
    );
  }
}

class DeleteProfileInitial extends DeleteProfileState {
  DeleteProfileInitial() : super(deleteRequestState: RequestState.init);
}