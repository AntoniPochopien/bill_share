import 'package:bill_share/auth/domain/user_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;
import 'package:bill_share/auth/domain/user.dart';

extension UserExtension on sp.User {
  User toDomain(UserData userData) =>
      User(id: id, username: userData.username, imageUrl: userData.imageUrl);
}
