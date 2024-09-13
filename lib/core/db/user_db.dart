import 'package:contacts_service/contacts_service.dart';
import 'package:jogja_kita_gamification/core/db/db.dart';
import 'package:jogja_kita_gamification/model/user_model.dart';
import 'package:permission_handler/permission_handler.dart';

class UserDb {
  JogjaKitaDb jogjaKitaDb = JogjaKitaDb.instance;
  static final UserDb instance = UserDb._();

  static const String tableName = "users";

  List<String> levels = ["Amateur", "Professional", "Champion", "Legendary"];

  UserDb._();
  // final _instance = UserDb();

  Future<void> create(UserModel user) async {
    final db = await jogjaKitaDb.database;
    await db.insert(tableName, user.toJson());
  }

  Future<UserModel> read(String userName) async {
    final db = await jogjaKitaDb.database;
    final maps = await db.query(
      tableName,
      columns: ["user_name, name, exp, poin, badge"],
      where: 'user_name = ?',
      whereArgs: [userName],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw Exception('user name $userName not found');
    }
  }

  Future<List<UserModel>> readAll() async {
    final db = await jogjaKitaDb.database;
    const orderBy = 'exp DESC';
    final result = await db.query(tableName, orderBy: orderBy);
    print(result);
    return result.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<int> update(UserModel user) async {
    final db = await jogjaKitaDb.database;
    return db.update(
      tableName,
      user.toJson(),
      where: 'user_name = ?',
      whereArgs: [user.userName],
    );
  }

  Future<int> delete(String userName) async {
    final db = await jogjaKitaDb.database;
    return await db.delete(
      tableName,
      where: 'user_name = ?',
      whereArgs: [userName],
    );
  }

  Future<int> updateExp(UserModel user) async {
    final db = await jogjaKitaDb.database;
    return await db.update(
      tableName,
      where: "userName = ?",
      whereArgs: [user.userName],
      <String, Object?>{
        "name": user.name,
        "user_name": user.userName,
        "exp": user.exp! + 50
      },
    );
  }

  Future<void> createFromContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contact = await ContactsService.getContacts();

      var listContacts = contact.toList();
      for (var data in listContacts) {
        print(data.givenName);
      }
      print(listContacts.length);
    } else {
      print('Permission Denied');
    }
  }
}
