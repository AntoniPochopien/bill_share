import 'dart:async';
import 'dart:developer';

import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/auth/infrastructure/user_to_domain.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:bill_share/auth/domain/user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository iAuthRepository;
  final InjectableUser injectableUser;
  AuthCubit({
    required this.iAuthRepository,
    required this.injectableUser,
  }) : super(AuthState.unauthenticated());
  late final StreamSubscription<sb.AuthState> authSubscription;

  void init() {
    authSubscription = iAuthRepository.authStateChange().listen((data) async {
      final session = data.session;
      if (session?.user != null) {
        log('user authenticated');
        final username = await iAuthRepository.getUsername();
        username.fold(
          (l) => emit(AuthState.error(l)),
          (r) {
            final user = session!.user.toDomain(r);
            injectableUser.setUser(user);
            emit(AuthState.authenticated(user));
          },
        );
      } else {
        log('user unauthenticated');
        emit(AuthState.unauthenticated());
      }
    });
  }

  void googleSignIn() async {
    await iAuthRepository.googleSignIn();
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
    result.fold((l) => emit(AuthState.error(l)), (r) {});
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

  @override
  Future<void> close() {
    authSubscription.cancel();
    return super.close();
  }
}
