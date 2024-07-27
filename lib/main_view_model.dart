import 'package:flutter/material.dart';

import 'core/db/user_db.dart';
import 'core/model/user_model.dart';

class MainViewModel extends ChangeNotifier {
  UserModel? currentUser;

  UserDb userDb = UserDb.instance;

  Future<void> getCurrentUser(String userName) async {
    currentUser = await userDb.read(userName);
    notifyListeners();
  }
}
