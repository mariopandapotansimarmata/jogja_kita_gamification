import 'package:jogja_kita_gamification/core/db/db.dart';
import 'package:jogja_kita_gamification/core/model/user_model.dart';

class UserDb {
  JogjaKitaDb jogjaKitaDb = JogjaKitaDb.instance;
  static final UserDb instance = UserDb._();

  static const String tableName = "users";

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
}
