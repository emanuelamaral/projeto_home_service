import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/entity/user_entity.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? _user;

  UserEntity get user => _user!;

  void setUser(UserEntity user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
