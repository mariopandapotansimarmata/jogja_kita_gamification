import 'package:jogja_kita_gamification/core/db/db.dart';
import 'package:jogja_kita_gamification/model/coupon_model.dart';
import 'package:jogja_kita_gamification/model/user_model.dart';

class CouponDb {
  JogjaKitaDb jogjaKitaDb = JogjaKitaDb.instance;
  static final CouponDb instance = CouponDb._();

  static const String tableName = "coupons";

  CouponDb._();

  Future<CouponModel> create(CouponModel coupon) async {
    final db = await jogjaKitaDb.database;
    final id = await db.insert(tableName, coupon.toJson());
    return coupon.copy(couponId: id);
  }

  Future<UserModel> read(int couponId) async {
    final db = await jogjaKitaDb.database;
    final maps = await db.query(
      tableName,
      columns: ["coupon_id, user_id, coupon_name,dicount, is_claim"],
      where: 'coupon_id = ?',
      whereArgs: [couponId],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw Exception('ID $couponId not found');
    }
  }

  Future<List<CouponModel>> readAll() async {
    final db = await jogjaKitaDb.database;
    const orderBy = 'coupon_id DESC';
    final result = await db.query(tableName, orderBy: orderBy);
    return result.map((json) => CouponModel.fromJson(json)).toList();
  }

  Future<List<CouponModel>> readBasedCategory(String category) async {
    final db = await jogjaKitaDb.database;
    const orderBy = 'coupon_id DESC';
    final result = await db.query(tableName,
        orderBy: orderBy, where: "coupon_category = ?", whereArgs: [category]);
    return result.map((json) => CouponModel.fromJson(json)).toList();
  }

  Future<int> update(CouponModel coupon) async {
    final db = await jogjaKitaDb.database;
    return db.update(
      tableName,
      coupon.toJson(),
      where: 'coupon_id = ?',
      whereArgs: [coupon.couponId],
    );
  }

  Future<int> delete(int couponId) async {
    final db = await jogjaKitaDb.database;
    return await db.delete(
      tableName,
      where: 'coupon_id = ?',
      whereArgs: [couponId],
    );
  }

  Future<List<Map<String, Object?>>> getLastId() async {
    final db = await jogjaKitaDb.database;
    return await db.rawQuery("""SELECT coupon_id 
                                FROM coupons 
                                ORDER BY coupon_id DESC 
                                LIMIT 1""");
  }
}
