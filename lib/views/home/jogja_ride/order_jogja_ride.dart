import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/model/coupon_model.dart';
import 'package:jogja_kita_gamification/view_model/coupon_view_model.dart';
import 'package:jogja_kita_gamification/view_model/order_view_model.dart';
import 'package:jogja_kita_gamification/views/component/google_maps.dart';
import 'package:jogja_kita_gamification/views/home/coupon/coupon.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride_widget/bottom_payment.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride_widget/price_card.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/pickup_jogja_ride.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

import '../../../view_model/user_view_model.dart';

class OrderJogjaRide extends StatefulWidget {
  const OrderJogjaRide({super.key, this.coupon, required this.initialService});
  final CouponModel? coupon;
  final bool initialService;
  @override
  State<OrderJogjaRide> createState() => _OrderJogjaRideState();
}

class _OrderJogjaRideState extends State<OrderJogjaRide> {
  bool light = false;
  late bool rideSwitch;

  @override
  void initState() {
    setState(() {
      rideSwitch = widget.initialService;
      if (rideSwitch) {
        context.read<OrderViewModel>().price =
            context.read<OrderViewModel>().jogjaRidePrice;
      } else {
        context.read<OrderViewModel>().price =
            context.read<OrderViewModel>().jogjaCarPrice;
      }
      context.read<OrderViewModel>().refreshTotalPrice(widget.coupon);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orderViewModel = context.watch<OrderViewModel>();
    var couponViewModel = context.watch<CouponViewModel>();
    var user = context.watch<UserViewModel>().currentUser;

    return MaterialApp(
      theme: ThemeData(),
      home: SafeArea(
        child: Scaffold(
          bottomSheet: SizedBox(
            height: MediaQuery.of(context).size.height * 0.44,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: (MediaQuery.of(context).size.height * 0.29),
                    minHeight: (MediaQuery.of(context).size.height * 0.27),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  // height: (MediaQuery.of(context).size.height * 0.27),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Text("data"),
                      InkWell(
                        onTap: () {
                          setState(() {
                            rideSwitch = true;

                            orderViewModel.price =
                                orderViewModel.jogjaRidePrice;
                            print(orderViewModel.price);
                            orderViewModel.refreshTotalPrice(widget.coupon);
                          });
                        },
                        child: PriceCardOrder(
                          icon: Icons.directions_bike,
                          name: "Jogja Ride",
                          price:
                              "Rp ${orderViewModel.jogjaRidePrice.toString()}",
                          isBordered: rideSwitch,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            rideSwitch = false;

                            orderViewModel.price = orderViewModel.jogjaCarPrice;
                            print(orderViewModel.price);
                            orderViewModel.refreshTotalPrice(widget.coupon);
                          });
                        },
                        child: PriceCardOrder(
                          icon: Icons.car_repair,
                          name: "Jogja Car",
                          price:
                              "Rp ${orderViewModel.jogjaCarPrice.toString()}",
                          isBordered: !rideSwitch,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Exp  +50",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Icon(
                              Icons.control_camera_outlined,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.coupon != null ? "Potongan Kupon" : "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.coupon != null
                                    ? "- Rp ${context.read<OrderViewModel>().discountCoupon}"
                                    : "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green),
                              ),
                            ],
                          )),

                      SizedBox(
                        width: MediaQuery.of(context).size.width - 42,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  color: Colors.amber,
                                  Icons.currency_bitcoin,
                                  size: 30,
                                ),
                                Text(
                                  "${user!.poin}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Switch(
                                      // This bool value toggles the switch.
                                      value: light,
                                      activeColor: Colors.red,
                                      onChanged: (bool value) {
                                        setState(() {
                                          light = value;
                                          if (light == true) {
                                            user.setPoin = -1000;
                                            orderViewModel
                                                .togglepoinDiscount(light);
                                            orderViewModel.refreshTotalPrice(
                                                widget.coupon);
                                          } else {
                                            setState(() {
                                              user.setPoin = 1000;
                                            });
                                            orderViewModel
                                                .togglepoinDiscount(light);
                                            orderViewModel.refreshTotalPrice(
                                                widget.coupon);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    "- Rp ${orderViewModel.poinDiscount}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    // height: 100,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BottomPayment(
                                  icon: Icon(
                                    Icons.payments_outlined,
                                    color: Color(0xffCA110F),
                                  ),
                                  name: "Tunai",
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    widget.coupon == null
                                        ? Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                            return CouponPage(
                                              category:
                                                  rideSwitch ? "ride" : "car",
                                            );
                                          }))
                                        : setState(() {});
                                  },
                                  child: const BottomPayment(
                                    icon: Icon(
                                      Icons.discount,
                                      color: Color(0xff299640),
                                    ),
                                    name: "Pakai Kupon",
                                  ),
                                ),
                                const Icon(Icons.more_horiz)
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffCB1112)),
                              onPressed: () async {
                                OverlayLoadingProgress.start(context,
                                    widget: const Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                            Text(
                                              "Pesanan sedang di proses",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                                await orderViewModel.createOrder(
                                    orderViewModel.total,
                                    user,
                                    rideSwitch == true ? "ride" : "car",
                                    "UPNYK Babarsari");
                                await couponViewModel
                                    .deleteCoupon(widget.coupon);
                                await context
                                    .read<UserViewModel>()
                                    .updateUser(user);
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                OverlayLoadingProgress.stop();
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return PickupJogjaRide(
                                      total: orderViewModel.total,
                                    );
                                  },
                                ));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Pesan Sekarang",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Rp ${orderViewModel.total}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                        )
                      ],
                    ))
              ],
            ),
          ),
          body: SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.45,
            maxHeight: MediaQuery.of(context).size.height * 0.45,
            isDraggable: false,
            panel: const Stack(
              alignment: Alignment.topLeft,
              children: [],
            ),
            body: Stack(
              children: [
                const GoogleMapView(),
                Positioned(
                    left: 16,
                    top: MediaQuery.of(context).size.height * 0.42,
                    child: InkWell(
                      onTap: () {
                        orderViewModel.total = 0;
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ],
                              color: Colors.white,
                              // border: Border.all(color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: const Icon(
                            Icons.arrow_back,
                            weight: 50,
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
