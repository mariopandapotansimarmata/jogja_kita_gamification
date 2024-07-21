import 'package:flutter/material.dart';

import 'order_icons.dart';

class ActiveOrderCard extends StatelessWidget {
  const ActiveOrderCard(
      {super.key,
      required this.orderId,
      required this.dateTime,
      required this.amount,
      required this.isFinish});

  // isFinish: false,
  //     userId: currentUser!.userId.toString(),
  //     dateTime: DateTime.now(),
  //     amount: 20000);
  final String orderId;
  final String? dateTime;
  final int amount;
  final bool isFinish;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: Row(
        children: [
          ActiveOrderIcon(
            size: 75,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mie Gacoan, Gejayan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              Text(
                "Driver menuju resto Mie Gacoan, Gejayan",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffAB1F21),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Pesanan diperkirakan akan tiba",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 88, 86, 87),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dateTime!,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              )
            ],
          )
        ],
      ),
    );
  }
}
