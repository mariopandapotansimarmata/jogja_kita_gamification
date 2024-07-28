import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/db/order_db.dart';
import '../core/model/coupon_model.dart';
import '../core/model/order_model.dart';
import '../core/model/user_model.dart';

class OrderViewModel extends ChangeNotifier {
  // Assuming OrderDb is a singleton instance.
  final OrderDb orderDb = OrderDb.instance;

  int jogjaRidePrice = 12000;
  int? discountCoupon;
  int poinDiscount = 0;
  int total = 0;

  void refreshTotalPrice(CouponModel? coupon) {
    if (coupon != null) {
      discountCoupon = coupon.discount;
      total = jogjaRidePrice - discountCoupon! - poinDiscount;
    } else {
      total = jogjaRidePrice - poinDiscount;
    }
  }

  Future<void> createOrder(int total, UserModel user) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy  kk:mm').format(now);

    final data = OrderModel(
        orderCategory: "ride",
        orderName: "UPNYK Babarsari",
        isFinish: 0,
        userName: user.userName.toString(),
        dateTime: formattedDate,
        amount: total);

    await orderDb.create(data);
  }

  void togglepoinDiscount(bool light) {
    poinDiscount = light ? 1000 : 0;
  }
}
