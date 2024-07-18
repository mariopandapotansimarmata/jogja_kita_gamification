import 'package:flutter/material.dart';

import 'package:jogja_kita_gamification/views/component/google_maps.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'order_jogja_ride_widget/price_card.dart';

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
            minHeight: MediaQuery.of(context).size.height * 0.38,
            maxHeight: MediaQuery.of(context).size.height * 0.38,
            isDraggable: false,
            panel: Stack(
              alignment: Alignment.topLeft,
              children: [
                Positioned(
                    top: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppBar(),
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
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      "Alamat Tersimpan",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const Image(
                                    width: 120,
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/address_none.png")),
                              ],
                            ))
                      ],
                    )),
              ],
            ),
            body: const GoogleMapView(),
          ),
        ),
      ),
    );
  }
}
