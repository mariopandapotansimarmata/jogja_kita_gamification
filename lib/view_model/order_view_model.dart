import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/db/order_db.dart';
import '../model/coupon_model.dart';
import '../model/order_model.dart';
import '../model/user_model.dart';

class OrderViewModel extends ChangeNotifier {
  final OrderDb orderDb = OrderDb.instance;

  List<OrderModel> listActiveOrders = [];
  List<OrderModel> listFinishOrders = [];

  int jogjaRidePrice = 12000;
  int jogjaCarPrice = 24000;
  int jogjaFood = 30000;
  int price = 0;
  int? discountCoupon;
  int poinDiscount = 0;
  int total = 0;

  void refreshTotalPrice(CouponModel? coupon) {
    if (coupon != null) {
      discountCoupon = coupon.discount;
      total = price - discountCoupon! - poinDiscount;
    } else {
      total = price - poinDiscount;
    }
  }

  Future<void> createOrder(
      int total, UserModel user, String category, String name) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy  kk:mm').format(now);

    final data = OrderModel(
        orderCategory: category,
        orderName: name,
        isFinish: 0,
        userName: user.userName.toString(),
        dateTime: formattedDate,
        amount: total);

    await orderDb.create(data);

    // Delay 5 seconds before spawning notification
    Future.delayed(const Duration(seconds: 5), () {
      spawnNotification(category, "Driver telah tiba");
    });
  }

  Future<void> showAllActiveOrders() async {
    final orders = await orderDb.readActiveOrders();
    listActiveOrders = orders;
    notifyListeners();
  }

  Future<void> showAllFinishOrders() async {
    final orders = await orderDb.readFinisedOrders();
    listFinishOrders = orders;
    notifyListeners();
  }

  Future<void> updateFinishStatus(OrderModel order) async {
    await orderDb.update(order);
    showAllActiveOrders();
  }

  Future<void> deleteOrder(OrderModel? order) async {
    if (order != null && order.orderId != null) {
      await orderDb.delete(order.orderId!);
    }
  }

  void togglepoinDiscount(bool light) {
    poinDiscount = light ? 1000 : 0;
    notifyListeners();
  }

  void spawnNotification(String category, String message) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            largeIcon: "asset://assets/PUTIH.png",
            bigPicture: "asset://assets/PUTIH.png",
            id: 1,
            channelKey: "order_channel",
            title: "Jogja$category",
            body: message));
  }
}
