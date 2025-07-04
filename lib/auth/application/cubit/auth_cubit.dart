import 'dart:async';
import 'dart:developer';

import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/i_user_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/auth/infrastructure/user_to_domain.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:bill_share/auth/domain/user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository iAuthRepository;
  final InjectableUser injectableUser;
  final ILocalStorageRepository iLocalStorageRepository;
  final IUserRepository iUserRepository;
  AuthCubit({
    required this.iUserRepository,
    required this.iAuthRepository,
    required this.injectableUser,
    required this.iLocalStorageRepository,
  }) : super(AuthState.unauthenticated());
  StreamSubscription<sb.AuthState>? authSubscription;

  void init() {
    authSubscription = iAuthRepository.authStateChange().listen((data) async {
      final session = data.session;
      if (session?.user != null) {
        log('user authenticated');
        final userData = await iUserRepository.getUserData(session!.user.id);
        userData.fold(
          (l) => emit(AuthState.error(l)),
          (userData) {
            final user = session.user.toDomain(userData);
            injectableUser.setUser(user);
            emit(AuthState.authenticated(user));
          },
        );
      } else {
        log('user unauthenticated');
        injectableUser.clearUser();
        emit(AuthState.unauthenticated());
      }
    });
  }

  void googleSignIn() async {
    emit(AuthState.loading());
    final result = await iAuthRepository.googleSignIn();
    result.fold((l) => emit(AuthState.error(l)), (r) {});
  }

  void signUpWithEmail({
    required String email,
    required String username,
    required String password,
  }) async {
    emit(AuthState.loading());
    final result = await iAuthRepository.signUpWithEmail(
      email: email.trim(),
      username: username.trim(),
      password: password.trim(),
    );
    result.fold(
        (l) => emit(AuthState.error(l)), (r) => emit(AuthState.confirmEmail()));
  }

  void signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(AuthState.loading());
    final result = await iAuthRepository.signInWithEmail(
      email: email.trim(),
      password: password.trim(),
    );
    result.fold((l) => emit(AuthState.error(l)), (r) {});
  }

  void logOut() async {
    emit(AuthState.unauthenticated());
    await iAuthRepository.logOut();
    await iLocalStorageRepository.saveLastGroupId(null);
    injectableUser.clearUser();
  }

  @override
  Future<void> close() {
    authSubscription?.cancel();
    return super.close();
  }
}
