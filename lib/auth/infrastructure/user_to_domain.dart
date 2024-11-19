import 'package:supabase_flutter/supabase_flutter.dart' as sp;
import 'package:bill_share/auth/domain/user.dart';

extension UserExtension on sp.User {
  User toDomain(String? username) => User(id: id, username: username);
}
