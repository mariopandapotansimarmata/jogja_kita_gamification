import 'package:jogja_kita_gamification/core/db/db.dart';

import '../../model/order_model.dart';

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

  Future<OrderModel> read(String userName) async {
    final db = await jogjaKitaDb.database;
    final maps = await db.query(
      tableName,
      columns: [
        "order_id, user_name, date_time, order_name,order_category ,is_finish"
      ],
      where: 'user_name = ?',
      whereArgs: [userName],
    );

    if (maps.isNotEmpty) {
      return OrderModel.fromJson(maps.first);
    } else {
      throw Exception('ID $userName not found');
    }
  }

  Future<List<OrderModel>> readActiveOrders() async {
    final db = await jogjaKitaDb.database;
    const orderBy = 'order_id DESC';
    final result = await db.query(tableName,
        orderBy: orderBy, where: "is_finish = ?", whereArgs: [0]);

    return result.map((json) => OrderModel.fromJson(json)).toList();
  }

  Future<List<OrderModel>> readAll() async {
    final db = await jogjaKitaDb.database;
    const orderBy = 'order_id DESC';
    final result = await db.query(tableName, orderBy: orderBy);

    return result.map((json) => OrderModel.fromJson(json)).toList();
  }

  Future<List<OrderModel>> readFinisedOrders() async {
    final db = await jogjaKitaDb.database;
    const orderBy = 'order_id DESC';
    final result = await db.query(tableName,
        orderBy: orderBy, where: "is_finish = ?", whereArgs: [1]);

    return result.map((json) => OrderModel.fromJson(json)).toList();
  }

  Future<int> update(OrderModel order) async {
    final db = await jogjaKitaDb.database;

    return db.update(
      tableName,
      order.toJson(),
      where: 'order_id = ?',
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
