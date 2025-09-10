import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../authuntication/presentation/bloc/login_bloc.dart';
import '../../domain/usecases/delete_profile_usecases.dart';
import 'delete_profile_event.dart';
import 'delete_profile_state.dart';

@injectable
class DeleteProfileBloc extends Bloc<DeleteProfileEvent, DeleteProfileState> {
  final DeleteProfileUseCase deleteProfileUseCase;

  DeleteProfileBloc(this.deleteProfileUseCase) : super(DeleteProfileState()) {
    on<DeleteProfileEvent>((event, emit) async {
      emit(state.copyWith(deleteRequestState: RequestState.loading));

      final result = await deleteProfileUseCase
          .callDeleteProfile(); // لو مش محتاج request

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              deleteRequestState: RequestState.error,
              failure: failure,
            ),
          );
        },
        (response) {
          emit(
            state.copyWith(
              deleteRequestState: RequestState.success,
              message: response.message,
            ),
          );
        },
      );
    });
  }
}
