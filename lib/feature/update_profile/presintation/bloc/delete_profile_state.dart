import '../../../../core/error_handling/falliures.dart';
import '../../../authuntication/presentation/bloc/login_bloc.dart';

class DeleteProfileState {
  final RequestState? deleteRequestState;
  final String? message;
  final MovieFailure? failure;

  DeleteProfileState({this.deleteRequestState, this.message, this.failure});

  DeleteProfileState copyWith({
    RequestState? deleteRequestState,
    String? message,
    MovieFailure? failure,
  }) {
    return DeleteProfileState(
      deleteRequestState: deleteRequestState ?? this.deleteRequestState,
      message: message ?? this.message,
      failure: failure ?? this.failure,
    );
  }
}
