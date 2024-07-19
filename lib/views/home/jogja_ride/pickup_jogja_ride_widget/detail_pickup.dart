import 'package:flutter/material.dart';

class DetailPickup extends StatelessWidget {
  const DetailPickup({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Detail Pengantaran",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 120,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 40,
                      color: Colors.green[700],
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey[300],
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.red[700],
                      size: 40,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Lokasi Jemput",
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text(
                            "UPNYK Kampus 1",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text("Jl.Ringroad Utara",
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Lokasi antar",
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text(
                            "Mie Gacoan Gejayan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text("Jl.Affandi ",
                                  style: TextStyle(fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
