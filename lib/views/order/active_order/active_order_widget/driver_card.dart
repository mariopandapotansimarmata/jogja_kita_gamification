import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/order/active_order/active_order_widget/order_icons.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              // top: BorderSide(color: Colors.grey, width: 0.3),
              bottom: BorderSide(color: Colors.grey, width: 0.3))),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: MediaQuery.of(context).size.width * 0.6,
            child: const Row(
              children: [
                DriverProfileIcon(size: 35),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Christian Cahyo Saputra",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                    Text("Xride | AB 5920")
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width * 0.35) - 34,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContactIcon(size: 30, icon: Icons.phone),
                ContactIcon(size: 30, icon: Icons.message)
              ],
            ),
          )
        ],
      ),
    );
  }
}
