import '../models/delete_profile_model_response.dart';

abstract class DeleteProfileRemoteDS {
  Future<DeleteProfileModelResponse> deleteProfile();
}
