
import 'package:bill_share/auth/domain/user.dart';

class InjectableUser {
  User? _currentUser;

  User get currentUser {
    if (_currentUser == null) {
      throw StateError('User is not authenticated!');
    }
    return _currentUser!;
  }

  void setUser(User user) => _currentUser = user;

  void clearUser() => _currentUser = null;
}
