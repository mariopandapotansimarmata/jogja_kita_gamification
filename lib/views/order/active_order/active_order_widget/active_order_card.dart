import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/model/order_model.dart';

import 'order_icons.dart';

class ActiveOrderRideCard extends StatefulWidget {
  const ActiveOrderRideCard({
    super.key,
    required this.order,
  });

  // final String orderId;
  // final String? dateTime;
  // final int amount;
  // final bool isFinish;
  // final IconData icon;

  final OrderModel order;

  @override
  State<ActiveOrderRideCard> createState() => _ActiveOrderRideCardState();
}

class _ActiveOrderRideCardState extends State<ActiveOrderRideCard> {
  Map<String, IconData> iconMap = {
    "ride": Icons.directions_bike,
    "food": Icons.fastfood,
    "car": Icons.car_repair
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: Row(
        children: [
          ActiveOrderIcon(
            icon: iconMap[widget.order.orderCategory]!,
            size: 75,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.order.orderName!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              Text(
                widget.order.orderCategory == "food"
                    ? "Driver menuju resto Mie Gacoan, Gejayan"
                    : "Driver menuju lokasi anda",
                style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffAB1F21),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Jl. Ringroad Utara",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 88, 86, 87),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.order.dateTime!,
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
