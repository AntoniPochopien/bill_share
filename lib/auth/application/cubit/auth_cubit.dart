import 'dart:async';
import 'dart:developer';

import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository iAuthRepository;
  AuthCubit({required this.iAuthRepository}) : super(AuthState.initial());
  late final StreamSubscription<sb.AuthState> authSubscription;

  void init() {
    authSubscription = iAuthRepository.authStateChange().listen((data) {
      final session = data.session;
      log('sesion $session');
    });
  }

  void googleSignIn() async => await iAuthRepository.googleSignIn();
}
