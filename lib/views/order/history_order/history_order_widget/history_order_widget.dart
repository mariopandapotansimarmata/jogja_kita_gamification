import 'package:flutter/material.dart';

import '../../active_order/active_order_widget/order_icons.dart';

class HistoryOrderCard extends StatelessWidget {
  const HistoryOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 86,
      child: Row(
        children: [
          const ActiveOrderIcon(
            size: 75,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mie Gacoan, Gejayan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "10 Jul 2024 11.58",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 135, 131, 132),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const Text(
                      "Selesai",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 54, 134, 59),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Text(
                "1 Udang Keju + 1 Mie Hompimpa Lv1",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Text(
                "12:20-1230",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              )
            ],
          )
        ],
      ),
    );
  }
}
