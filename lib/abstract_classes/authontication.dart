import 'package:salahlypackage/abstract_classes/user.dart';

import 'package:salahlypackage/abstract_classes/user.dart';

abstract class Authentication {
  Future<bool> login(UserType user);
  Future<bool> signup(UserType user);
}
