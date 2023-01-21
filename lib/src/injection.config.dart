// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_images/core/services/data_preferences.dart' as _i4;
import 'package:app_images/src/repository/local/img_repository.dart' as _i10;
import 'package:app_images/src/repository/remote/auth_repository.dart' as _i5;
import 'package:app_images/src/service/local/img_services.dart' as _i7;
import 'package:app_images/src/service/remote/auth_services.dart' as _i3;
import 'package:app_images/src/src.dart' as _i6;
import 'package:app_images/src/usescases/local/delete_image.dart' as _i12;
import 'package:app_images/src/usescases/local/get_images.dart' as _i13;
import 'package:app_images/src/usescases/local/save_image.dart' as _i11;
import 'package:app_images/src/usescases/remote/auth/log_out.dart' as _i8;
import 'package:app_images/src/usescases/remote/auth/sign_in.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AuthServices>(() => _i3.AuthServices());
  gh.lazySingleton<_i4.DataPreferences>(() => _i4.DataPreferences());
  gh.lazySingleton<_i5.IAuthRepository>(
      () => _i5.AuthRepository(gh<_i6.AuthServices>()));
  gh.lazySingleton<_i7.ImgServices>(() => _i7.ImgServices());
  gh.lazySingleton<_i8.LogOut>(() => _i8.LogOut(gh<_i6.IAuthRepository>()));
  gh.lazySingleton<_i9.SignIn>(() => _i9.SignIn(gh<_i6.IAuthRepository>()));
  gh.lazySingleton<_i10.IImgRepository>(
      () => _i10.ImgRepository(gh<_i6.ImgServices>()));
  gh.lazySingleton<_i11.SaveImage>(
      () => _i11.SaveImage(gh<_i6.IImgRepository>()));
  gh.lazySingleton<_i12.DeleteImage>(
      () => _i12.DeleteImage(gh<_i6.IImgRepository>()));
  gh.lazySingleton<_i13.GetImages>(
      () => _i13.GetImages(gh<_i6.IImgRepository>()));
  return getIt;
}
