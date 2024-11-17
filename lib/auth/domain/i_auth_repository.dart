import 'package:bill_share/common/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IAuthRepository {
  Future<Either<Failure, Unit>> googleSignIn();
  Stream<AuthState> authStateChange();
  Session? checkIfSessionExists();
  Future<void> logOut();
}
