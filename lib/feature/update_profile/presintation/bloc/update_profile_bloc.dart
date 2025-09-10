import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_model_response.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_profile_request.dart';
import 'package:movies/feature/update_profile/domain/usecases/update_profile_usecases.dart';

import '../../../../core/error_handling/falliures.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

@injectable
class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileUseCases updateProfileUseCases;

  UpdateProfileBloc(this.updateProfileUseCases)
    : super(UpdateProfileInitial()) {
    on<UpdateBtnEvent>((event, emit) async {
      emit(state.copyWith(updateRequestState: RequestState.loading));
      UpdateProfileRequest request = UpdateProfileRequest(
        email: event.email,
        avaterId: event.avaterId,
        name: event.name,
        phone: event.phone,
      );
      var result = await updateProfileUseCases.updateCall(request);
      result.fold(
        (l) {
          emit(
            state.copyWith(updateRequestState: RequestState.error, failure: l),
          );
          print(l);
        },
        (model) {
          emit(
            state.copyWith(
              updateRequestState: RequestState.success,
              updateModelResponse: model,
            ),
          );
          print(model);
        },
      );
    });
  }
}
