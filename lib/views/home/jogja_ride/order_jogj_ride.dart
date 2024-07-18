import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/component/google_maps.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride_widget/bottom_payment.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride_widget/price_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OrderJogjaRide extends StatefulWidget {
  const OrderJogjaRide({super.key});

  @override
  State<OrderJogjaRide> createState() => _OrderJogjaRideState();
}

class _OrderJogjaRideState extends State<OrderJogjaRide> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade100),
          ),
      home: Scaffold(
        body: SafeArea(
          child: SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.45,
            maxHeight: MediaQuery.of(context).size.height * 0.45,
            isDraggable: false,
            panel: Stack(
              alignment: Alignment.topLeft,
              children: [
                Positioned(
                    top: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // AppBar(
                        //   leading: Icon(Icons.abc),
                        //   backgroundColor: Colors.transparent,
                        // ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width,
                          height: (MediaQuery.of(context).size.height * 0.27),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey)),
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const PriceCardOrder(
                                color: Color(0xffFCE7E9),
                                icon: Icons.directions_bike,
                                name: "Jogja Ride",
                                price: "Rp 12.000",
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Icon(
                                      Icons.control_camera_outlined,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 42,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(
                                          color: Colors.amber,
                                          Icons.currency_bitcoin,
                                          size: 30,
                                        ),
                                        Text(
                                          "Pakai Bonus Poinmu (100.000)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Switch(
                                      // This bool value toggles the switch.
                                      value: light,
                                      activeColor: Colors.red,
                                      onChanged: (bool value) {
                                        // This is called when the user toggles the switch.
                                        setState(() {
                                          light = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 150,
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BottomPayment(
                                          icon: Icon(
                                            Icons.payments_outlined,
                                            color: Color(0xffCA110F),
                                          ),
                                          name: "Tunai",
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BottomPayment(
                                          icon: Icon(
                                            Icons.discount,
                                            color: Color(0xff299640),
                                          ),
                                          name: "Pakai Voucher",
                                        ),
                                        Icon(Icons.more_horiz)
                                      ],
                                    )),
                                Container(
                                  height: 60,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffCB1112)),
                                      onPressed: () {},
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Pesan Sekarang",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Rp 12.000",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                )
                              ],
                            ))
                      ],
                    )),
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
