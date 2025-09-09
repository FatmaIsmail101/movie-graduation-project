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
    gh.lazySingleton<_i397.LoginRequestApi>(
      () => dioModule.loginRequestApi(gh<_i361.Dio>()),
    );
    gh.factory<_i417.AuthRemoteDS>(() => _i663.AuthRemoteDSImpl());
    gh.factory<_i65.AuthRepo>(
      () => _i759.AuthRepoImpl(gh<_i417.AuthRemoteDS>()),
    );
    gh.factory<_i253.LoginUseCase>(
      () => _i253.LoginUseCase(gh<_i65.AuthRepo>()),
    );
    gh.factory<_i70.LoginBloc>(() => _i70.LoginBloc(gh<_i253.LoginUseCase>()));
    return this;
  }
}

class _$DioModule extends _i397.DioModule {}
