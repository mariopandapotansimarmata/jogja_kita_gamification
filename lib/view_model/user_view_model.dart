import 'package:flutter/material.dart';

import '../core/db/user_db.dart';
import '../model/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserDb userDb = UserDb.instance;
  List<UserModel> usersList = [];
  UserModel? currentUser;

  Future<void> getCurrentUser(String userName) async {
    currentUser = await userDb.read(userName);
    notifyListeners();
  }

  Future<void> updateUser(UserModel user) async {
    await userDb.update(user);
    notifyListeners();
  }

  Future<void> readAllUsers() async {
    var users = await userDb.readAll();

    usersList = users;
    notifyListeners();
  }
}
