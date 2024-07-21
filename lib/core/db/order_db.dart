import 'package:jogja_kita_gamification/core/db/db.dart';

import '../model/order_model.dart';

class OrderDb {
  JogjaKitaDb jogjaKitaDb = JogjaKitaDb.instance;
  static final OrderDb instance = OrderDb._();

  static const String tableName = "orders";

  OrderDb._();
  // final _instance = OrderDb();

  Future<OrderModel> create(OrderModel order) async {
    final db = await jogjaKitaDb.database;
    final id = await db.insert(tableName, order.toJson());

    return order.copy(orderId: id);
  }

  Future<OrderModel> read(int userId) async {
    final db = await jogjaKitaDb.database;
    final maps = await db.query(
      tableName,
      columns: ["order_id, user_id, coupon_name, dicount, is_finish"],
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    if (maps.isNotEmpty) {
      return OrderModel.fromJson(maps.first);
    } else {
      throw Exception('ID $userId not found');
    }
  }

  Future<List<OrderModel>> readAll() async {
    final db = await jogjaKitaDb.database;
    const orderBy = 'order_id DESC';
    final result = await db.query(tableName, orderBy: orderBy);

    return result.map((json) => OrderModel.fromJson(json)).toList();
  }

  Future<int> update(OrderModel order) async {
    final db = await jogjaKitaDb.database;

    return db.update(
      tableName,
      order.toJson(),
      where: 'coupon_id = ?',
      whereArgs: [order.orderId],
    );
  }

  Future<int> delete(int orderId) async {
    final db = await jogjaKitaDb.database;

    return await db.delete(
      tableName,
      where: 'order_id = ?',
      whereArgs: [orderId],
    );
  }
}
