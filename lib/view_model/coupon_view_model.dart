import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/coupon_db.dart';
import 'package:jogja_kita_gamification/model/user_model.dart';

import '../model/coupon_model.dart';

class CouponViewModel extends ChangeNotifier {
  CouponDb couponDb = CouponDb.instance;
  List<CouponModel> listCoupons = [];

  int id = 4;
  Future<void> showAllCoupons() async {
    final coupons = await couponDb.readAll();
    listCoupons = coupons;
    notifyListeners();
  }

  Future<void> showCouponsByCategory(String category) async {
    final coupons = await couponDb.readBasedCategory(category);
    listCoupons = coupons;
    notifyListeners();
  }

  generateCoupon(UserModel? user) async {
    String category;

    int? discount;
    List<Map<String, Object?>> lastId = await couponDb.getLastId();
    var id = int.parse((lastId[0]["coupon_id"]).toString());
    switch (user!.badge) {
      case "Amateur":
        discount = 1000;
      case "Professional":
        discount = 2000;
      case "Champion":
        discount = 5000;
      case "Legend":
        discount = 7500;
    }

    Timer.periodic(
      const Duration(hours: 24),
      (timer) async {
        switch (DateTime.now().day ~/ 7) {
          case 0:
            category = "ride";
          case 1:
            category = "food";
          case 2:
            category = "car";
          case 3:
            category = "food";
          default:
            category = "ride";
        }

        if (DateTime.now().weekday == DateTime.monday) {
          id++;
          String capCategory =
              category[0].toUpperCase() + category.substring(1);
          await couponDb.create(CouponModel(
              couponId: id,
              couponName: "$capCategory Rp.$discount",
              couponCategory: category,
              discount: discount,
              userName: user.userName));
          print("coupon added, couponid $id, $category");
        }
      },
    );
  }

  Future<void> deleteCoupon(CouponModel? coupon) async {
    if (coupon != null && coupon.couponId != null) {
      await couponDb.delete(coupon.couponId!);
    }
  }
}
