import 'package:flutter/material.dart';

import '../../active_order/active_order_widget/order_icons.dart';

class HistoryOrderCard extends StatelessWidget {
  const HistoryOrderCard(
      {super.key,
      required this.orderId,
      required this.dateTime,
      required this.amount,
      required this.orderName,
      required this.orderCategory,
      required this.icon});
  final IconData icon;
  final int orderId;
  final String dateTime;
  final String orderName;
  final String orderCategory;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 86,
      child: Row(
        children: [
          ActiveOrderIcon(
            size: 75,
            icon: icon,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
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
                "Jl. Ringroad Utara ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Text(
                "3,2 KM",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              )
            ],
          )
        ],
      ),
    );
  }
}
