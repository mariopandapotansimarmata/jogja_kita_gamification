import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/pickup_jogja_ride_widget/detail_pickup.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/pickup_jogja_ride_widget/pick_up_driver_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../component/google_maps.dart';

class PickupJogjaRide extends StatefulWidget {
  const PickupJogjaRide({
    super.key,
  });
  // final bool? isNewOrder;

  @override
  State<PickupJogjaRide> createState() => _PickupJogjaRideState();
}

class _PickupJogjaRideState extends State<PickupJogjaRide> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).popUntil((route) => route.isFirst);
    //   scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
    //     content: Text('Returned from Second Screen'),
    //   ));
    // });

    return MaterialApp(
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade100),
          ),
      home: Scaffold(
        body: SafeArea(
          child: SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.45,
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            // isDraggable: false,
            panel: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Color(0xffCA110F),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: AppBar(
                    // centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Driver menuju lokasimu",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                    top: 50,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          width: MediaQuery.of(context).size.width,
                          height: (MediaQuery.of(context).size.height * 0.6),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey)),
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10))),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Perkiraan sampai pukul 12:29 - 12:39",
                                    style: TextStyle(
                                        color: Color(0xffCA110F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const PickUpDriverCard(),
                              const DetailPickup(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                margin: const EdgeInsets.only(top: 20),
                                width: MediaQuery.of(context).size.width,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Detail Pengantaran",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Biaya Pengantaran",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text("3.2 KM"),
                                          ],
                                        ),
                                        Text(
                                          "Rp 15.000",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
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
