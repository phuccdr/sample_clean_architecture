// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo/data/network/service/api_services.dart' as _i17;
import 'package:demo/data/repository/academy_record_repo_imp.dart' as _i192;
import 'package:demo/data/repository/auth_repo_imp.dart' as _i777;
import 'package:demo/domain/repository/academy_record_repo.dart' as _i660;
import 'package:demo/domain/repository/auth_repo.dart' as _i747;
import 'package:demo/domain/usecase/get_academy_record.dart' as _i540;
import 'package:demo/domain/usecase/login_use_case.dart' as _i696;
import 'package:demo/presentation/academy_record/academy_record_cubit.dart'
    as _i686;
import 'package:demo/presentation/login/login_cubit.dart' as _i550;
import 'package:demo/shared/di/app_module.dart' as _i182;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i17.ApiServices>(() => _i17.ApiServices(gh<_i361.Dio>()));
    gh.lazySingleton<_i660.AcademyRecordRepo>(
      () => _i192.AcademyRecordRepoImp(gh<_i17.ApiServices>()),
    );
    gh.lazySingleton<_i747.AuthRepository>(
      () => _i777.AuthRepositoryImp(gh<_i17.ApiServices>()),
    );
    gh.factory<_i696.LoginUseCase>(
      () => _i696.LoginUseCase(gh<_i747.AuthRepository>()),
    );
    gh.factory<_i540.GetAcademyRecordUseCase>(
      () => _i540.GetAcademyRecordUseCase(gh<_i660.AcademyRecordRepo>()),
    );
    gh.factory<_i686.AcademyRecordCubit>(
      () => _i686.AcademyRecordCubit(gh<_i540.GetAcademyRecordUseCase>()),
    );
    gh.factory<_i550.LoginCubit>(
      () => _i550.LoginCubit(gh<_i696.LoginUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i182.RegisterModule {}
