
import 'package:bill_share/auth/domain/user.dart';

class InjectableUser {
  User? _currentUser;

  User get currentUser =>  _currentUser ?? User(id: '');
  

  void setUser(User user) => _currentUser = user;

  void clearUser() => _currentUser = null;
}
