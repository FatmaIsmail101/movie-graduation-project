import 'package:injectable/injectable.dart';
import 'package:movies/feature/update_profile/%20%20data/data_source/update_remote_ds.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_model_response.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_profile_request.dart';
import 'package:movies/feature/update_profile/network/update_profile_api.dart';

import '../../../../core/di/di.dart';

@Injectable(as: UpdateRemoteDS)
class UpdateRemoteDSImpl implements UpdateRemoteDS {
  final token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YzA1YzMzMzNjZGFjN2EzZDBkMGJhNCIsImVtYWlsIjoiZmF0bWFJc21haWxAZ21haWwuY29tIiwiaWF0IjoxNzU3NDQ3ODM1fQ.8mmUvgIWH5AxS7JYTU23pv_A5J_wRrKCLH01zUvfAvQ";

  //
  @override
  Future<UpdateModelResponse> updateDS(UpdateProfileRequest request) {
    return getIt<UpdateProfileApi>().update(request, "Bearer $token");
  }
}
