import 'package:injectable/injectable.dart';
import 'package:movies/feature/update_profile/%20%20data/data_source/delete_profile_remote_ds.dart';
import 'package:movies/feature/update_profile/network/delete_profile_api.dart';

import '../../../../core/di/di.dart';

@Injectable(as: DeleteProfileRemoteDS)
class DeleteProfileRemoteDSImpl implements DeleteProfileRemoteDS {
  @override
  Future<void> deleteProfile(String token) async {
    return getIt<DeleteProfileApi>().deleteProfile("Bearer $token");
  }
}
