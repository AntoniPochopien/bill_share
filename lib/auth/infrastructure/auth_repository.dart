import 'dart:developer';

import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/constants/secrets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository implements IAuthRepository {
  final _supabase = Supabase.instance.client;

  @override
  void init() {
    _supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      //TODO handle login
    });
  }

  @override
  Future<void> googleSignIn() async {
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
    } catch (e) {
      log('_googleSignIn error: $e');
    }
  }
}
