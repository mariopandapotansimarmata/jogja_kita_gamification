import 'package:flutter/material.dart';

import 'order_icons.dart';

class ActiveOrderRideCard extends StatelessWidget {
  const ActiveOrderRideCard(
      {super.key,
      required this.orderId,
      required this.dateTime,
      required this.amount,
      required this.isFinish,
      required this.icon});

  final String orderId;
  final String? dateTime;
  final int amount;
  final bool isFinish;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: Row(
        children: [
          ActiveOrderIcon(
            icon: icon,
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
              const Text(
                "Driver menuju resto Mie Gacoan, Gejayan",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffAB1F21),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Pesanan diperkirakan akan tiba",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 88, 86, 87),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dateTime!,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              )
            ],
          )
        ],
      ),
    );
  }
}
