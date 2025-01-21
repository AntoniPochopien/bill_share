import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/i_user_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/auth/infrastructure/auth_repository.dart';
import 'package:bill_share/auth/infrastructure/user_repository.dart';
import 'package:bill_share/expense_creator/domain/i_expenses_repository.dart';
import 'package:bill_share/expense_creator/infrastructure/expenses_repository.dart';
import 'package:bill_share/group_navigator/domain/i_group_repository.dart';
import 'package:bill_share/group_navigator/infrastructure/group_repository.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:bill_share/home/infrastructure/groups_repository.dart';
import 'package:bill_share/payments/domain/i_payments_repository.dart';
import 'package:bill_share/payments/infrastructure/payments_repository.dart';
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
  getIt.registerLazySingleton(() => InjectableUser());
  getIt.registerLazySingleton<IGroupsRepository>(() => GroupsRepository());
  getIt.registerLazySingleton<IGroupRepository>(() => GroupRepository());
  getIt.registerLazySingleton<IExpensesRepository>(() => ExpensesRepository());
  getIt.registerLazySingleton<IUserRepository>(() => UserRepository());
  getIt.registerLazySingleton<IPaymentsRepository>(() => PaymentsRepository());
}
