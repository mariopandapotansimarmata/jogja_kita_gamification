import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../component/form_field_text.dart';
import '../../component/google_maps.dart';

class JogjaRide extends StatefulWidget {
  const JogjaRide({super.key, required this.initialService});
  final bool initialService;

  @override
  State<JogjaRide> createState() => _JogjaRideState();
}

class _JogjaRideState extends State<JogjaRide> {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(),
      home: SafeArea(
        child: Scaffold(
          body: SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.45,
            maxHeight: MediaQuery.of(context).size.height * 0.6,
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
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    title: Text(
                      widget.initialService == true
                          ? "Jogja Ride"
                          : "Jogja Car",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  top: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        height:
                            (MediaQuery.of(context).size.height * 0.4) - 160,
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Mau diantar kemana ?",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const FormFieldText(
                              icon: Icons.location_on_rounded,
                              iconColor: Color(0xffCA110F),
                              name: "Cari Lokasi Tujuan",
                            ),
                            InkWell(
                              onTap: () =>
                                  Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return OrderJogjaRide(
                                      initialService: widget.initialService);
                                },
                              )),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.map,
                                      color: Color(0xffCA110F),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Pilih lokasi dari maps",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Cari lokasi dengan geser-geser maps",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 116, 115, 116)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
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
                                  image: AssetImage("assets/address_none.png")),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
            body: const GoogleMapView(),
          ),
        ),
      ),
    );
  }
}
