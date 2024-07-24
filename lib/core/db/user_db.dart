import 'package:jogja_kita_gamification/core/db/db.dart';
import 'package:jogja_kita_gamification/core/model/user_model.dart';

class UserDb {
  JogjaKitaDb jogjaKitaDb = JogjaKitaDb.instance;
  static final UserDb instance = UserDb._();

  static const String tableName = "users";

  UserDb._();
  // final _instance = UserDb();

  Future<UserModel> create(UserModel user) async {
    final db = await jogjaKitaDb.database;
    final id = await db.insert(tableName, user.toJson());
    return user.copy(userId: id);
  }

  Future<UserModel> read(String userName) async {
    final db = await jogjaKitaDb.database;
    final maps = await db.query(
      tableName,
      columns: ["user_id, name, user_name, exp"],
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

  Future<int> delete(int id) async {
    final db = await jogjaKitaDb.database;
    return await db.delete(
      tableName,
      where: 'userId = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateExp(UserModel user) async {
    final db = await jogjaKitaDb.database;
    return await db.update(
      tableName,
      where: "userName = ?",
      whereArgs: [user.userName],
      <String, Object?>{
        "user_id": user.userId,
        "name": user.name,
        "user_name": user.userName,
        "exp": user.exp! + 50
      },
    );
  }
}
