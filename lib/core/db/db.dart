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
      user_name VARCHAR PRIMARY KEY,
      name VARCHAR NOT NULL,
      exp INTEGER DEFAULT 0,
      poin INTEGER DEFAULT 0,
      badge VARCHAR NOT NULL
    )
  ''');

    await db.execute('''
    CREATE TABLE ${OrderDb.tableName} (
      order_id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_name VARCHAR NOT NULL,
      date_time DateTime NOT NULL,
      order_name VARCHAR NOT NULL,
      order_category VARCHAR NOT NULL,
      amount INTEGER NOT NULL,
      is_finish BOOL NOT NULL,
      FOREIGN KEY (user_name) REFERENCES users (user_name)                  
      ON DELETE NO ACTION ON UPDATE NO ACTION
    )
  ''');

    await db.execute('''
    CREATE TABLE ${CouponDb.tableName} (
      coupon_id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_name VARCHAR NOT NULL,
      coupon_category VARCHAR NOT NULL,
      coupon_name DateTime NOT NULL,
      discount INTEGER NOT NULL,
      FOREIGN KEY (user_name) REFERENCES users (user_name)                  
       ON DELETE NO ACTION ON UPDATE NO ACTION
    )
  ''');

    // Using a batch to execute multiple inserts
    Batch batch = db.batch();

    batch.insert('users', {
      'name': 'Alice Smith',
      'user_name': 'alice_smith',
      'exp': 150,
      "poin": 50000,
      "badge": "Amateur"
    });
    batch.insert('users', {
      'name': 'Bob Johnson',
      'user_name': 'bob_johnson',
      'exp': 200,
      "poin": 50000,
      "badge": "Amateur"
    });
    batch.insert('users', {
      'name': 'Charlie Brown',
      'user_name': 'charlie_brown',
      'exp': 300,
      "poin": 50000,
      "badge": "Professional"
    });
    batch.insert('users', {
      'name': 'David Wilson',
      'user_name': 'david_wilson',
      'exp': 250,
      "poin": 50000,
      "badge": "Amateur"
    });
    batch.insert('users', {
      'name': 'Eve Davis',
      'user_name': 'eve_davis',
      'exp': 100,
      "poin": 50000,
      "badge": "Amateur"
    });
    batch.insert('users', {
      'name': 'Frank Moore',
      'user_name': 'frank_moore',
      'exp': 350,
      "poin": 50000,
      "badge": "Professional"
    });
    batch.insert('users', {
      'name': 'Grace Taylor',
      'user_name': 'grace_taylor',
      'exp': 650,
      "poin": 50000,
      "badge": "Professional"
    });
    batch.insert('users', {
      'name': 'Hank Anderson',
      'user_name': 'hank_anderson',
      'exp': 450,
      "poin": 50000,
      "badge": "Professional"
    });
    batch.insert('users', {
      'name': 'Ivy Thomas',
      'user_name': 'ivy_thomas',
      'exp': 200,
      "poin": 50000,
      "badge": "Amateur"
    });
    batch.insert('users', {
      'name': 'Jack Lee',
      'user_name': 'jack_lee',
      'exp': 650,
      "poin": 50000,
      "badge": "Professional"
    });
    batch.insert('users', {
      'name': 'Mario Pandapotan S',
      'user_name': 'mario_pan',
      'exp': 200,
      "poin": 50000,
      "badge": "Amateur"
    });

    batch.insert('coupons', {
      'user_name': 'mario_pan',
      'coupon_name': "Discount 2rb",
      "coupon_category": "food",
      "discount": 2000,
    });

    batch.insert('coupons', {
      'user_name': 'mario_pan',
      'coupon_name': "Discount 2rb",
      "coupon_category": "ride",
      "discount": 2000,
    });

    // Map<String, Object?> toJson() => {
    //       "coupon_id": couponId,
    //       "user_id": userId,
    //       "coupon_name": couponName,
    //       "coupon_category": couponCategory,
    //       "discount": discount,
    //       "is_claim": isClaim
    //     };

    await batch.commit(noResult: true);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
