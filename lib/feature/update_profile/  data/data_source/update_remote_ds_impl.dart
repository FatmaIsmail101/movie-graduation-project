import 'package:injectable/injectable.dart';
import 'package:movies/feature/update_profile/%20%20data/data_source/update_remote_ds.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_model_response.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_profile_request.dart';
import 'package:movies/feature/update_profile/network/update_profile_api.dart';

import '../../../../core/di/di.dart';

@Injectable(as: UpdateRemoteDS)
class UpdateRemoteDSImpl implements UpdateRemoteDS {

  //
  @override
  Future<UpdateModelResponse> updateDS(UpdateProfileRequest request,
      String token) {
    print("====================Update Profile Request=========");
    print("Token : Bearer $token");
    print("Body : ${request.toJson()}");

    return getIt<UpdateProfileApi>().update(request, 'Bearer $token');
  }
}
