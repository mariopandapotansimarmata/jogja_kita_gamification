import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/coupon_db.dart';
import 'package:jogja_kita_gamification/core/db/order_db.dart';
import 'package:jogja_kita_gamification/core/model/coupon_model.dart';
import 'package:jogja_kita_gamification/core/model/order_model.dart';
import 'package:jogja_kita_gamification/main.dart';
import 'package:jogja_kita_gamification/views/component/google_maps.dart';
import 'package:jogja_kita_gamification/views/home/coupon/coupon.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride_widget/bottom_payment.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride_widget/price_card.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/pickup_jogja_ride.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:intl/intl.dart';

import '../../../main_view_model.dart';

class OrderJogjaRide extends StatefulWidget {
  const OrderJogjaRide({super.key, this.coupon});
  final CouponModel? coupon;
  @override
  State<OrderJogjaRide> createState() => _OrderJogjaRideState();
}

class _OrderJogjaRideState extends State<OrderJogjaRide> {
  bool light = false;
  bool isLoading = false;

  int jogjaRidePrice = 12000;
  int? discountCoupon;
  int poinDiscount = 0;
  int total = 0;

  CouponDb couponDb = CouponDb.instance;

  OrderDb orderDB = OrderDb.instance;

  Future<void> deleteCoupon(CouponModel? coupon) async {
    if (coupon != null && coupon.couponId != null) {
      await couponDb.delete(coupon.couponId!);
    }
  }

  Future<void> createNote(int total) async {
    setState(() {
      isLoading = true;
    });
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy  kk:mm').format(now);

    final data = OrderModel(
        orderCategory: "ride",
        orderName: "UPNYK Babarsari",
        isFinish: 0,
        userName:
            context.read<MainViewModel>().currentUser!.userName.toString(),
        dateTime: formattedDate,
        amount: total);

    await orderDB.create(data);

    setState(() {
      isLoading = false;
    });
  }

  void refreshTotalPrice(int discount) {
    poinDiscount = discount;
    setState(() {
      if (widget.coupon != null) {
        discountCoupon = widget.coupon!.discount;
        total = jogjaRidePrice + (-discountCoupon!) + (-poinDiscount);
      } else {
        total = jogjaRidePrice - poinDiscount;
      }
    });
  }

  @override
  void initState() {
    setState(() {
      refreshTotalPrice(poinDiscount);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade100),
          ),
      home: Scaffold(
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
                    PriceCardOrder(
                      color: const Color(0xffFCE7E9),
                      icon: Icons.directions_bike,
                      name: "Jogja Ride",
                      price: "Rp ${jogjaRidePrice.toString()}",
                      isBordered: true,
                    ),
                    const PriceCardOrder(
                      color: Colors.transparent,
                      icon: Icons.car_repair,
                      name: "Jogja Car",
                      price: "Rp 24.000",
                      isBordered: false,
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
                                  ? "- Rp $discountCoupon"
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
                          const Row(
                            children: [
                              Icon(
                                color: Colors.amber,
                                Icons.currency_bitcoin,
                                size: 30,
                              ),
                              Text(
                                "Poinmu (100.000)",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Switch(
                                  // This bool value toggles the switch.
                                  value: light,
                                  activeColor: Colors.red,
                                  onChanged: (bool value) {
                                    setState(() {
                                      light = value;
                                      poinDiscount = light ? 1000 : 0;
                                      refreshTotalPrice(poinDiscount);
                                    });
                                  },
                                ),
                                Text(
                                  "- Rp $poinDiscount",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                onTap: () {
                                  widget.coupon == null
                                      ? Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                          return const CouponPage();
                                        }))
                                      : setState(() {});
                                },
                                child: const BottomPayment(
                                  icon: Icon(
                                    Icons.discount,
                                    color: Color(0xff299640),
                                  ),
                                  name: "Pakai Voucher",
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
                              createNote(total);
                              deleteCoupon(widget.coupon);
                              await Future.delayed(const Duration(seconds: 2));
                              OverlayLoadingProgress.stop();
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return PickupJogjaRide(
                                    total: total,
                                  );
                                },
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Pesan Sekarang",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rp $total",
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
        body: SafeArea(
          child: SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.45,
            maxHeight: MediaQuery.of(context).size.height * 0.45,
            isDraggable: false,
            panel: const Stack(
              alignment: Alignment.topLeft,
              children: [
                // Positioned(
                //     top: 10,
                //     child: ),
              ],
            ),
            body: Stack(
              children: [
                const GoogleMapView(),
                Positioned(
                    left: 16,
                    top: MediaQuery.of(context).size.height * 0.42,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
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
