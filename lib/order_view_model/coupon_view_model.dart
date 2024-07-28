import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/coupon_db.dart';

import '../core/model/coupon_model.dart';

class CouponViewModel extends ChangeNotifier {
  CouponDb couponDb = CouponDb.instance;

  Future<void> deleteCoupon(CouponModel? coupon) async {
    if (coupon != null && coupon.couponId != null) {
      await couponDb.delete(coupon.couponId!);
    }
  }
}
