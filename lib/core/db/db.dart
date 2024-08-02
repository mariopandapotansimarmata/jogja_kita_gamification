import 'package:jogja_kita_gamification/core/db/coupon_db.dart';
import 'package:jogja_kita_gamification/core/db/quiz_db.dart';
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
    print(databasePath);
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
    await db.execute('''
    CREATE TABLE ${QuizDB.tableName} (
      quiz_id INTEGER PRIMARY KEY AUTOINCREMENT,
      question VARCHAR NOT NULL,
      first_choice VARCHAR NOT NULL,
      second_choice VARCHAR NOT NULL,
      third_choice VARCHAR NOT NULL,
      forth_choice VARCHAR NOT NULL,
      correct_answer VARCHAR NOT NULL               
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
      "badge": "Champion"
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
      "badge": "Champion"
    });
    batch.insert('users', {
      'name': 'Mario Pandapotan S',
      'user_name': 'mario_pan',
      'exp': 200, // deafult value is 200 , 950 for testing
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

    batch.insert('quiz', {
      'question':
          'Kapan Perjanjian Giyanti, yang membagi Kerajaan Mataram menjadi Kesultanan Yogyakarta dan Kasunanan Surakarta, ditandatangani ?',
      'first_choice': "1745",
      "second_choice": "1755",
      "third_choice": "1765",
      "forth_choice": "1775",
      "correct_answer": "1755"
    });

    batch.insert('quiz', {
      'question': 'Apa nama keraton atau istana resmi dari Sultan Yogyakarta ?',
      'first_choice': "Keraton Surakarta",
      "second_choice": "Pura Pakualaman",
      "third_choice": "Keraton Ngayogyakarta",
      "forth_choice": "Pura Mangkunegara",
      "correct_answer": "Keraton Ngayogyakarta"
    });

    batch.insert('quiz', {
      'question':
          'Apa peristiwa yang dikenal sebagai "Serangan Umum 1 Maret 1949" di Yogyakarta ?',
      'first_choice': "Serangan TNI terhadap Belanda di Yogyakarta",
      "second_choice": "Serangan Belanda terhadap rakyat Yogyakarta",
      "third_choice": "Deklarasi kemerdekaan Yogyakarta",
      "forth_choice": "Pemindahan ibu kota Indonesia ke Yogyakarta",
      "correct_answer": "Serangan TNI terhadap Belanda di Yogyakarta"
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
