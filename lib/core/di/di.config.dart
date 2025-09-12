// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/authuntication/data/data_source/auth_remote_ds.dart'
    as _i411;
import '../../feature/authuntication/data/data_source/auth_remote_ds_impl.dart'
    as _i902;
import '../../feature/authuntication/data/data_source/network/login_api.dart'
    as _i924;
import '../../feature/authuntication/data/reposiatry/auth_repo_impl.dart'
    as _i500;
import '../../feature/authuntication/domain/repositrory/auth_repo.dart'
    as _i139;
import '../../feature/authuntication/domain/usecases/login_usecase.dart'
    as _i894;
import '../../feature/authuntication/presentation/bloc/login_bloc.dart' as _i67;
import '../../feature/home_screen/modules/movie_details/data/datasource/movie_details_remote_ds.dart'
    as _i983;
import '../../feature/home_screen/modules/movie_details/data/datasource/movie_details_remote_ds_impl.dart'
    as _i585;
import '../../feature/home_screen/modules/movie_details/data/repo/movie_details_repo_impl.dart'
    as _i964;
import '../../feature/home_screen/modules/movie_details/domain/repo/movie_details_repo.dart'
    as _i100;
import '../../feature/home_screen/modules/movie_details/domain/usecase/movie_details_usecases.dart'
    as _i262;
import '../../feature/home_screen/modules/movie_details/network/movie_details_api.dart'
    as _i229;
import '../../feature/home_screen/modules/movie_details/presntation/bloc/movie_details_bloc.dart'
    as _i163;
import '../../feature/home_screen/modules/movie_details/presntation/details/movie_details_page.dart'
    as _i204;
import '../../feature/update_profile/%20%20data/data_source/delete_profile_remote_ds.dart'
    as _i1060;
import '../../feature/update_profile/%20%20data/data_source/delete_profile_remote_ds_impl.dart'
    as _i536;
import '../../feature/update_profile/%20%20data/data_source/update_remote_ds.dart'
    as _i855;
import '../../feature/update_profile/%20%20data/data_source/update_remote_ds_impl.dart'
    as _i987;
import '../../feature/update_profile/%20%20data/reposiatry/delete_profile_repo_impl.dart'
    as _i92;
import '../../feature/update_profile/%20%20data/reposiatry/update_profile_repo_impl.dart'
    as _i984;
import '../../feature/update_profile/domain/repositry/delete_profile_repo.dart'
    as _i653;
import '../../feature/update_profile/domain/repositry/update_profile_repo.dart'
    as _i824;
import '../../feature/update_profile/domain/usecases/delete_profile_usecases.dart'
    as _i19;
import '../../feature/update_profile/domain/usecases/update_profile_usecases.dart'
    as _i357;
import '../../feature/update_profile/network/update_profile_api.dart' as _i863;
import '../../feature/update_profile/presintation/bloc/delete_profile_bloc.dart'
    as _i643;
import '../../feature/update_profile/presintation/bloc/update_profile_bloc.dart'
    as _i814;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i1060.DeleteProfileRemoteDS>(
      () => _i536.DeleteProfileRemoteDSImpl(),
    );
    gh.factory<_i653.DeleteProfileRepo>(
      () => _i92.DeleteProfileRepoImpl(gh<_i1060.DeleteProfileRemoteDS>()),
    );
    gh.factory<_i204.MovieDetailsPage>(
      () => _i204.MovieDetailsPage(key: gh<_i409.Key>(), movieId: gh<int>()),
    );
    gh.lazySingleton<_i924.MovieClient>(
      () => dioModule.loginRequestApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i229.MovieDetailsApi>(
      () => dioModule.movieDetailsApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i863.UpdateProfileApi>(
      () => dioModule.updateProfileApi(gh<_i361.Dio>()),
    );
    gh.factory<_i411.AuthRemoteDS>(() => _i902.AuthRemoteDSImpl());
    gh.factory<_i983.MovieDetailsRemoteDS>(
      () => _i585.MovieDetailsRemoteDsImpl(),
    );
    gh.factory<_i855.UpdateRemoteDS>(() => _i987.UpdateRemoteDSImpl());
    gh.factory<_i139.AuthRepo>(
      () => _i500.AuthRepoImpl(gh<_i411.AuthRemoteDS>()),
    );
    gh.factory<_i894.LoginUseCase>(
      () => _i894.LoginUseCase(gh<_i139.AuthRepo>()),
    );
    gh.factory<_i100.MovieDetailsRepo>(
      () => _i964.MovieDetailsRepoImpl(gh<_i983.MovieDetailsRemoteDS>()),
    );
    gh.factory<_i67.LoginBloc>(() => _i67.LoginBloc(gh<_i894.LoginUseCase>()));
    gh.factory<_i19.DeleteProfileUseCase>(
      () => _i19.DeleteProfileUseCase(gh<_i653.DeleteProfileRepo>()),
    );
    gh.factory<_i824.UpdateProfileRepo>(
      () => _i984.UpdateProfileRepoImpl(gh<_i855.UpdateRemoteDS>()),
    );
    gh.factory<_i262.MovieDetailsUseCase>(
      () => _i262.MovieDetailsUseCase(gh<_i100.MovieDetailsRepo>()),
    );
    gh.factory<_i163.MovieDetailsBloc>(
      () => _i163.MovieDetailsBloc(gh<_i262.MovieDetailsUseCase>()),
    );
    gh.factory<_i643.DeleteProfileBloc>(
      () => _i643.DeleteProfileBloc(gh<_i19.DeleteProfileUseCase>()),
    );
    gh.factory<_i357.UpdateProfileUseCases>(
      () => _i357.UpdateProfileUseCases(gh<_i824.UpdateProfileRepo>()),
    );
    gh.factory<_i814.UpdateProfileBloc>(
      () => _i814.UpdateProfileBloc(gh<_i357.UpdateProfileUseCases>()),
    );
    return this;
  }
}

class _$DioModule extends _i924.DioModule {}
