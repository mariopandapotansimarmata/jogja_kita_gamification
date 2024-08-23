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

  generateCoupon(UserModel? user) async {
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
        if (DateTime.now().weekday == DateTime.monday) {
          id++;
          await couponDb.create(CouponModel(
              couponId: id,
              couponName: "Badge Coupon",
              couponCategory: "ride",
              discount: discount,
              userName: user.userName));
          print("coupon added, couponid $id");
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
