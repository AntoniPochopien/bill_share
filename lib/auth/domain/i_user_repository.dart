import 'package:bill_share/auth/domain/user_data.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserData>> updateUserProfile({
    required String id,
    required String newUsername,
    required XFile? newProfileImage,
  });
  Future<Either<Failure, UserData>> getUserData(String userId);

  Future<Either<Failure, Unit>> updateUsername(String newUsername);
}
