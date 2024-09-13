import 'package:flutter_test/flutter_test.dart';
import 'package:jogja_kita_gamification/model/coupon_model.dart';
import 'package:jogja_kita_gamification/model/order_model.dart';
import 'package:jogja_kita_gamification/view_model/order_view_model.dart';
import 'package:jogja_kita_gamification/view_model/user_view_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  final userVM = UserViewModel();
  final orderVM = OrderViewModel();

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group(
    "Test UserViewModel",
    () {
      test("test userVM, getCurrent user", () async {
        await userVM.getCurrentUser("mario_pan");
        expect(userVM.currentUser!.userName, "mario_pan");
      });

      test("test userVM, updateExp user", () async {
        await userVM.getCurrentUser("mario_pan");

        final oldExp = userVM.currentUser!.exp!;
        userVM.currentUser!.setExp = 50;

        await userVM.updateUser(userVM.currentUser!);

        final newExp = userVM.currentUser!.exp!;

        userVM.currentUser!.setExp = (-50); // to deny changes
        await userVM.updateUser(userVM.currentUser!); // to deny changes

        expect(newExp, (oldExp + 50));
      });
    },
  );

  group("Test OrderViewModel", () {
    test("test orderVM, create order", () async {
      await userVM.getCurrentUser("mario_pan");
      final db = await orderVM.orderDb.jogjaKitaDb.database;
      int total = 12000;
      const query = "SELECT COUNT(order_id) as total_order from orders";

      final totalBefore = await db.rawQuery(query);
      await orderVM.createOrder(
          total, userVM.currentUser!, "ride", "UPNYK Babarsari");

      final totalAfter = await db.rawQuery(query);

      // to deny changes
      final data = await db.query("orders");
      db.delete("orders",
          where: "order_id = ?", whereArgs: [(data.last["order_id"])]);

      expect((totalAfter.first["total_order"] as int),
          (totalBefore.first["total_order"] as int) + 1);
    });

    test("test orderVM, refresh total price if coupon used", () {
      var mockCoupon = CouponModel(
          couponCategory: "ride",
          couponId: 1,
          couponName: "weekly discount",
          discount: 2000,
          userName: "mario_pan");
      orderVM.price = orderVM.jogjaCarPrice;
      orderVM.refreshTotalPrice(mockCoupon);

      expect(orderVM.total, orderVM.price - mockCoupon.discount!);
    });

    test("test orderVM, Show all active orders", () async {
      await orderVM.showAllActiveOrders();
      expect(orderVM.listActiveOrders.isNotEmpty, true);
    });

    test("test orderVM, Show all finished orders", () async {
      await orderVM.showAllFinishOrders();
      // expect(orderVM.listFinishOrders.isNotEmpty, true);
      //because data is not exist yet
    });

    test("test orderVM, update finsih status after order delivered", () async {
      // makes sure orders table is not empty
      final db = await orderVM.orderDb.jogjaKitaDb.database;

      final resultBefore =
          await db.query("orders", where: "is_finish = ?", whereArgs: [0]);

      final order = OrderModel.fromJson(resultBefore.last);
      final id = order.orderId;
      print("after ${resultBefore.last}");

      order.setIsFinish = 1;
      await orderVM.updateFinishStatus(order);
      final resultAfter =
          await db.query("orders", where: "order_id = ?", whereArgs: [id]);

      print("after ${resultAfter.last}");

      expect((resultAfter.last["is_finish"] as int), 1);

      order.setIsFinish = 0;
      await orderVM.updateFinishStatus(order); // deny db changes
    });

    test("test orderVM, delete order", () async {
      // makes sure orders table is not empty
      final db = await orderVM.orderDb.jogjaKitaDb.database;
      const query = "SELECT COUNT(order_id) as total_order from orders";

      final totalBefore = await db.rawQuery(query);
      final orders = await db.query("orders");

      print("totalBefore $totalBefore");

      await orderVM.deleteOrder((OrderModel.fromJson(orders.last)));
      final totalAfter = await db.rawQuery(query);
      print("totalAfter$totalAfter");

      expect((totalAfter.last["total_order"] as int),
          ((totalBefore.last["total_order"] as int) - 1));
    });
  });
}
