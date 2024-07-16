import 'package:flutter/material.dart';

import 'order_icons.dart';

class ActiveOrderCard extends StatelessWidget {
  const ActiveOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      child: const Row(
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
