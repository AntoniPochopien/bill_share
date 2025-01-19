import 'dart:developer';

import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/constants/secrets.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository implements IAuthRepository {
  final _supabase = Supabase.instance.client;

  @override
  Stream<AuthState> authStateChange() => _supabase.auth.onAuthStateChange;

  @override
  Future<Either<Failure, Unit>> googleSignIn() async {
    try {
      const googleSignInScopes = [
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ];

      final googleSignIn = GoogleSignIn(
        clientId: Secrets.googleClientId,
        serverClientId: Secrets.googleServerClientId,
        scopes: googleSignInScopes,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken!,
        accessToken: accessToken,
      );
      return right(unit);
    } catch (e) {
      log('googleSignIn unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUpWithEmail({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      await _supabase.auth.signUp(email: email, password: password, data: {
        'username': username,
      });
      return right(unit);
    } catch (e) {
      log('signUpWithEmail unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } catch (e) {
      log('signInWithEmail unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<void> logOut() async => await _supabase.auth.signOut();
}
