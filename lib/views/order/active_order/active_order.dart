import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/order_db.dart';
import 'package:jogja_kita_gamification/core/model/user_model.dart';
import 'package:jogja_kita_gamification/main.dart';
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

  Future<void> updateUserExp(UserModel user) async {
    await userDb.update(user);
    refreshNotes();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: listOrders.isEmpty
                ? Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 20),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          width: 150,
                          child: const Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/food-delivery.png'))),
                      Text(
                        'Tidak ada pesanan aktif ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
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
                                      return PickupJogjaRide(
                                        total: order.amount!,
                                      );
                                    },
                                  )),
                              child: Column(
                                children: [
                                  ActiveOrderRideCard(
                                    order: order,
                                  ),
                                ],
                              )),
                          InkWell(
                              onLongPress: () {
                                setState(() {
                                  listOrders.removeAt(index);
                                });
                                order.setIsFinish = 1;
                                currentUser!.setExp = 50;
                                print("exp saat ini ${currentUser!.exp}");
                                updateFinishStatus(order);
                                updateUserExp(currentUser!);
                                scaffoldMessengerKey.currentState?.showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.blue[500],
                                    content: const Row(
                                      children: [
                                        const Text(
                                            'Selamat Anda mendapatkan + 50'),
                                        Icon(
                                          Icons.control_camera_outlined,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
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
