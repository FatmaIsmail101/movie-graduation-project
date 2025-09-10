import 'package:injectable/injectable.dart';
import 'package:movies/feature/update_profile/%20%20data/data_source/delete_profile_remote_ds.dart';
import 'package:movies/feature/update_profile/%20%20data/models/delete_profile_model_response.dart';
import 'package:movies/feature/update_profile/network/delete_profile_api.dart';

import '../../../authuntication/data/data_source/di.dart';

@Injectable(as: DeleteProfileRemoteDS)
class DeleteProfileRemoteDSImpl implements DeleteProfileRemoteDS {
  final token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YzA1YzMzMzNjZGFjN2EzZDBkMGJhNCIsImVtYWlsIjoiZmF0bWFJc21haWxAZ21haWwuY29tIiwiaWF0IjoxNzU3NDQ3ODM1fQ.8mmUvgIWH5AxS7JYTU23pv_A5J_wRrKCLH01zUvfAvQ";

  @override
  Future<DeleteProfileModelResponse> deleteProfile() async {
    return getIt<DeleteProfileApi>().deleteProfile("Bearer $token");
  }
}
