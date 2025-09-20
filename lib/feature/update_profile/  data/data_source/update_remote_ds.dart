import 'package:movies/feature/update_profile/%20%20data/models/update_model_response.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_profile_request.dart';

abstract class UpdateRemoteDS {
  Future<UpdateModelResponse> updateDS(UpdateProfileRequest request,
      String token);
}
