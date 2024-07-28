import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/order_db.dart';
import 'package:jogja_kita_gamification/view_model/order_view_model.dart';
import 'package:jogja_kita_gamification/views/order/active_order/active_order_widget/active_order_card.dart';
import 'package:jogja_kita_gamification/views/order/active_order/active_order_widget/driver_card.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:provider/provider.dart';

import '../../../core/model/order_model.dart';
import '../../../view_model/user_view_model.dart';
import '../../home/jogja_ride/pickup_jogja_ride.dart';

class ActiveOrder extends StatefulWidget {
  const ActiveOrder({super.key});

  @override
  State<ActiveOrder> createState() => _ActiveOrderState();
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ExpBadge {
  final int maxExp;
  final String badge;

  ExpBadge(
    this.maxExp,
    this.badge,
  );
}

class _ActiveOrderState extends State<ActiveOrder> {
  OrderDb orderDb = OrderDb.instance;
  List<OrderModel> listOrders = [];
  List<ExpBadge> listExpBadges = [
    ExpBadge(249, "Amateur"),
    ExpBadge(599, "Professional"),
    ExpBadge(999, "Champion")
  ];

  @override
  void initState() {
    showAllActiveOrder();
    super.initState();
  }

  Future<void> showAllActiveOrder() async {
    final orders = await orderDb.readActiveOrders();
    setState(() {
      listOrders = orders;
    });
  }

  @override
  Widget build(BuildContext context) {
    var orderViewModel = context.watch<OrderViewModel>();
    var userViewModel = context.watch<UserViewModel>();

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
                          padding: const EdgeInsets.only(right: 20),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          width: 150,
                          child: const Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/food-delivery.png'))),
                      const Text(
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
                              onLongPress: () async {
                                setState(() {
                                  listOrders.removeAt(index);
                                });
                                order.setIsFinish = 1;
                                userViewModel.currentUser!.setExp = 50;
                                orderViewModel.updateFinishStatus(order);

                                scaffoldMessengerKey.currentState?.showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.blue[300],
                                    content: const Row(
                                      children: [
                                        Text('Selamat Anda mendapatkan + 50'),
                                        Icon(
                                          Icons.control_camera_outlined,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                                int currentindex = 0;
                                currentindex =
                                    listExpBadges.indexWhere((element) {
                                  if (userViewModel.currentUser!.badge ==
                                      element.badge) {
                                    index = listExpBadges.indexOf(
                                        element); // Store the index when found
                                    return true; // Return true when a match is found
                                  }
                                  return false;
                                });

                                if (userViewModel.currentUser!.exp! >
                                    listExpBadges[currentindex].maxExp) {
                                  userViewModel.currentUser!.setBadge =
                                      listExpBadges[currentindex + 1].badge;

                                  OverlayLoadingProgress.start(context,
                                      widget: Scaffold(
                                        backgroundColor: Colors.transparent,
                                        body: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // const CircularProgressIndicator(),
                                              Container(
                                                height: 200,
                                                width: 300,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                        "Selamat",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const Text(
                                                        "Anda Naik Level",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        userViewModel
                                                            .currentUser!
                                                            .badge!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    OverlayLoadingProgress
                                                        .stop();
                                                  },
                                                  child: const Text("Tutup"))
                                            ],
                                          ),
                                        ),
                                      ));

                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                } else if (userViewModel.currentUser!.exp! >
                                    listExpBadges.last.maxExp) {
                                  userViewModel.currentUser!.setBadge =
                                      "Legendary";
                                }
                                userViewModel
                                    .updateUserExp(userViewModel.currentUser!);
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
