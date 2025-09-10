// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../update_profile/%20%20data/data_source/delete_profile_remote_ds.dart'
    as _i822;
import '../../../update_profile/%20%20data/data_source/delete_profile_remote_ds_impl.dart'
    as _i724;
import '../../../update_profile/%20%20data/data_source/update_remote_ds.dart'
    as _i720;
import '../../../update_profile/%20%20data/data_source/update_remote_ds_impl.dart'
    as _i889;
import '../../../update_profile/%20%20data/reposiatry/delete_profile_repo_impl.dart'
    as _i289;
import '../../../update_profile/%20%20data/reposiatry/update_profile_repo_impl.dart'
    as _i868;
import '../../../update_profile/domain/repositry/delete_profile_repo.dart'
    as _i66;
import '../../../update_profile/domain/repositry/update_profile_repo.dart'
    as _i903;
import '../../../update_profile/domain/usecases/delete_profile_usecases.dart'
    as _i516;
import '../../../update_profile/domain/usecases/update_profile_usecases.dart'
    as _i981;
import '../../../update_profile/network/update_profile_api.dart' as _i962;
import '../../../update_profile/presintation/bloc/delete_profile_bloc.dart'
    as _i359;
import '../../../update_profile/presintation/bloc/update_profile_bloc.dart'
    as _i467;
import '../../domain/repositrory/auth_repo.dart' as _i65;
import '../../domain/usecases/login_usecase.dart' as _i253;
import '../../presentation/bloc/login_bloc.dart' as _i70;
import '../reposiatry/auth_repo_impl.dart' as _i759;
import 'auth_remote_ds.dart' as _i417;
import 'auth_remote_ds_impl.dart' as _i663;
import 'network/login_api.dart' as _i397;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i822.DeleteProfileRemoteDS>(
      () => _i724.DeleteProfileRemoteDSImpl(),
    );
    gh.factory<_i66.DeleteProfileRepo>(
      () => _i289.DeleteProfileRepoImpl(gh<_i822.DeleteProfileRemoteDS>()),
    );
    gh.lazySingleton<_i397.LoginRequestApi>(
      () => dioModule.loginRequestApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i962.UpdateProfileApi>(
      () => dioModule.updateProfileApi(gh<_i361.Dio>()),
    );
    gh.factory<_i417.AuthRemoteDS>(() => _i663.AuthRemoteDSImpl());
    gh.factory<_i720.UpdateRemoteDS>(() => _i889.UpdateRemoteDSImpl());
    gh.factory<_i65.AuthRepo>(
      () => _i759.AuthRepoImpl(gh<_i417.AuthRemoteDS>()),
    );
    gh.factory<_i253.LoginUseCase>(
      () => _i253.LoginUseCase(gh<_i65.AuthRepo>()),
    );
    gh.factory<_i70.LoginBloc>(() => _i70.LoginBloc(gh<_i253.LoginUseCase>()));
    gh.factory<_i516.DeleteProfileUseCase>(
      () => _i516.DeleteProfileUseCase(gh<_i66.DeleteProfileRepo>()),
    );
    gh.factory<_i903.UpdateProfileRepo>(
      () => _i868.UpdateProfileRepoImpl(gh<_i720.UpdateRemoteDS>()),
    );
    gh.factory<_i359.DeleteProfileBloc>(
      () => _i359.DeleteProfileBloc(gh<_i516.DeleteProfileUseCase>()),
    );
    gh.factory<_i981.UpdateProfileUseCases>(
      () => _i981.UpdateProfileUseCases(gh<_i903.UpdateProfileRepo>()),
    );
    gh.factory<_i467.UpdateProfileBloc>(
      () => _i467.UpdateProfileBloc(gh<_i981.UpdateProfileUseCases>()),
    );
    return this;
  }
}

class _$DioModule extends _i397.DioModule {}
