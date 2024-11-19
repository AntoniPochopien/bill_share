import 'package:bill_share/common/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IAuthRepository {
  Future<Either<Failure, Unit>> googleSignIn();
  Stream<AuthState> authStateChange();
  Future<void> logOut();
  Future<Either<Failure, Unit>> signUpWithEmail({
    required String email,
    required String username,
    required String password,
  });
  Future<Either<Failure, Unit>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, String?>> getUsername();

  Future<Either<Failure, Unit>> updateUsername(String newUsername);
}
