import 'package:jogja_kita_gamification/core/db/coupon_db.dart';
import 'package:jogja_kita_gamification/core/db/user_db.dart';
import 'package:sqflite/sqflite.dart';

import 'order_db.dart';

class JogjaKitaDb {
  static final JogjaKitaDb instance = JogjaKitaDb._();

  static Database? _database;

  JogjaKitaDb._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/jogja_kita.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${UserDb.tableName} (
      user_id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR NOT NULL,
      user_name TEXT NOT NULL,
      exp INTEGER DEFAULT 0
    )
  ''');

    await db.execute('''
    CREATE TABLE ${OrderDb.tableName} (
      order_id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id VARCHAR NOT NULL,
      date_time DateTime NOT NULL,
      order_name VARCHAR NOT NULL,
      order_category VARCHAR NOT NULL,
      amount INTEGER NOT NULL,
      is_finish BOOL NOT NULL,
      FOREIGN KEY (user_id) REFERENCES users (user_id)                  
       ON DELETE NO ACTION ON UPDATE NO ACTION
    )
  ''');

    await db.execute('''
    CREATE TABLE ${CouponDb.tableName} (
      coupon_id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id VARCHAR NOT NULL,
      coupon_name DateTime NOT NULL,
      discount INTEGER NOT NULL,
      is_claim BOOL NOT NULL,
      FOREIGN KEY (user_id) REFERENCES users (user_id)                  
       ON DELETE NO ACTION ON UPDATE NO ACTION
    )
  ''');

    // Using a batch to execute multiple inserts
    Batch batch = db.batch();

    batch.insert('users',
        {'name': 'Alice Smith', 'user_name': 'alice_smith', 'exp': 150});
    batch.insert('users',
        {'name': 'Bob Johnson', 'user_name': 'bob_johnson', 'exp': 200});
    batch.insert('users',
        {'name': 'Charlie Brown', 'user_name': 'charlie_brown', 'exp': 300});
    batch.insert('users',
        {'name': 'David Wilson', 'user_name': 'david_wilson', 'exp': 250});
    batch.insert(
        'users', {'name': 'Eve Davis', 'user_name': 'eve_davis', 'exp': 100});
    batch.insert('users',
        {'name': 'Frank Moore', 'user_name': 'frank_moore', 'exp': 350});
    batch.insert('users',
        {'name': 'Grace Taylor', 'user_name': 'grace_taylor', 'exp': 400});
    batch.insert('users',
        {'name': 'Hank Anderson', 'user_name': 'hank_anderson', 'exp': 450});
    batch.insert(
        'users', {'name': 'Ivy Thomas', 'user_name': 'ivy_thomas', 'exp': 200});
    batch.insert(
        'users', {'name': 'Jack Lee', 'user_name': 'jack_lee', 'exp': 500});
    batch.insert('users', {'name': 'mario', 'user_name': 'mario', 'exp': 123});

    await batch.commit(noResult: true);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
