import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/order_db.dart';
import 'package:jogja_kita_gamification/views/order/active_order/active_order_widget/active_order_card.dart';
import 'package:jogja_kita_gamification/views/order/active_order/active_order_widget/driver_card.dart';

import '../../../core/model/order_model.dart';
import '../../home/jogja_ride/pickup_jogja_ride.dart';

class ActiveOrder extends StatefulWidget {
  const ActiveOrder({super.key});

  @override
  State<ActiveOrder> createState() => _ActiveOrderState();
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class _ActiveOrderState extends State<ActiveOrder> {
  OrderDb orderDb = OrderDb.instance;
  List<OrderModel> listOrders = [];

  @override
  void initState() {
    showAllActiveOrder();
    super.initState();
  }

  Future<void> refreshNotes() async {
    final orders = await orderDb.readActiveOrders();
    setState(() {
      listOrders = orders;
    });
  }

  Future<void> showAllActiveOrder() async {
    final orders = await orderDb.readActiveOrders();
    setState(() {
      listOrders = orders;
    });
  }

  Future<void> updateFinishStatus(OrderModel order) async {
    await orderDb.update(order);
    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pesanan Aktif",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const Text(
            "Pesanan yang sedang berlangsung",
            style: TextStyle(
                color: Color.fromARGB(255, 88, 86, 87),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: listOrders.isEmpty
                ? const Text(
                    'No Notes yet',
                    style: TextStyle(color: Colors.white),
                  )
                : ListView.builder(
                    itemCount: listOrders.length,
                    itemBuilder: (context, index) {
                      final OrderModel order = listOrders[index];
                      return Column(
                        children: [
                          InkWell(
                              onTap: () =>
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const PickupJogjaRide();
                                    },
                                  )),
                              child: Column(
                                children: [
                                  ActiveOrderRideCard(
                                    icon: order.orderCategory == "ride"
                                        ? Icons.directions_bike
                                        : Icons.fastfood,
                                    amount: order.amount!,
                                    dateTime: order.dateTime,
                                    isFinish: false,
                                    orderId: order.orderId.toString(),
                                  ),
                                ],
                              )),
                          InkWell(
                              onLongPress: () {
                                setState(() {
                                  listOrders.removeAt(index);
                                });
                                order.setIsFinish = 1;
                                updateFinishStatus(order);

                                scaffoldMessengerKey.currentState?.showSnackBar(
                                  const SnackBar(
                                    content: Text('Order '),
                                  ),
                                );
                              },
                              child: const DriverCard()),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
