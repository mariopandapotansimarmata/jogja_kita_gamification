import 'package:flutter_test/flutter_test.dart';
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
        var databasesPath = await databaseFactory.getDatabasesPath();

        print("Database path: $databasesPath");
        await userVM.getCurrentUser("mario_pan");
        expect(userVM.currentUser!.userName, "mario_pan");
      });

      test("test userVM, updateExp user", () async {
        await userVM.getCurrentUser("mario_pan");

        final oldExp = userVM.currentUser!.exp!;
        userVM.currentUser!.setExp = 50;

        await userVM.updateUserExp(userVM.currentUser!);

        final newExp = userVM.currentUser!.exp!;

        userVM.currentUser!.setExp = (-50); // to deny changes
        await userVM.updateUserExp(userVM.currentUser!); // to deny changes

        expect(newExp, (oldExp + 50));
      });
    },
  );

  group("Test Order View Model", () {
    test("test orderVM, create order", () async {
      await userVM.getCurrentUser("mario_pan");
      final db = await orderVM.orderDb.jogjaKitaDb.database;
      int total = 12000;
      const query = "SELECT COUNT(order_id) as total_order from orders";

      final totalBefore = await db.rawQuery(query);
      await orderVM.createOrder(total, userVM.currentUser!);

      final totalAfter = await db.rawQuery(query);

      // to deny changes
      final data = await db.query("orders");
      db.delete("orders",
          where: "order_id = ?", whereArgs: [(data.last["order_id"])]);

      expect((totalAfter.first["total_order"] as int),
          (totalBefore.first["total_order"] as int) + 1);
    });
  });
}
