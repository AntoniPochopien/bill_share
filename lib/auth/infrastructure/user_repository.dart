import 'dart:developer';
import 'dart:io';

import 'package:bill_share/auth/domain/i_user_repository.dart';
import 'package:bill_share/auth/domain/user_data.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class UserRepository implements IUserRepository {
  final _supabase = sb.Supabase.instance.client;

  @override
  Future<Either<Failure, Unit>> updateUserProfile({
    required String id,
    required String newUsername,
    required XFile? newProfileImage,
  }) async {
    try {
      final newImageUrl = newProfileImage != null
          ? await _supabase.storage.from('users_avatars').upload(
              id, File(newProfileImage.path),
              fileOptions: sb.FileOptions(upsert: true))
          : null;

      final body = {
        'username': newUsername,
        if (newImageUrl != null) 'image_url': newImageUrl,
      };

      await _supabase.from('profiles').update(body).eq('id', id);

      return right(unit);
    } catch (e) {
      log('updateUserProfile unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, UserData>> getUserData(String userId) async {
    try {
      final userProfile = await _supabase
          .from('profiles')
          .select('username, image_url')
          .eq('id', userId)
          .single();
      return right(UserData.fromJson(userProfile));
    } catch (e) {
      log('getUserData unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUsername(String newUsername) async {
    try {
      final currentUserId = _supabase.auth.currentSession!.user.id;
      await _supabase
          .from('profiles')
          .update({'username': newUsername}).eq('id', currentUserId);
      return right(unit);
    } catch (e) {
      log('updateUsername unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
