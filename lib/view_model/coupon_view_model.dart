import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/coupon_db.dart';

import '../core/model/coupon_model.dart';

class CouponViewModel extends ChangeNotifier {
  CouponDb couponDb = CouponDb.instance;
  List<CouponModel> listCoupons = [];

  Future<void> showAllCoupons() async {
    final coupons = await couponDb.readAll();
    listCoupons = coupons;
    notifyListeners();
  }

  Future<void> deleteCoupon(CouponModel? coupon) async {
    if (coupon != null && coupon.couponId != null) {
      await couponDb.delete(coupon.couponId!);
    }
  }
}
