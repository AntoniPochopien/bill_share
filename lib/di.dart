import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/infrastructure/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:bill_share/local_storage/infrastructure/local_storage_repository.dart';
import 'package:bill_share/navigation/app_router.dart';

final getIt = GetIt.instance;

void diInit() {
  getIt.registerLazySingleton(() => AppRouter());
  getIt.registerLazySingleton<ILocalStorageRepository>(
      () => LocalStorageRepository());
  getIt.registerLazySingleton<IAuthRepository>(() => AuthRepository());
}
