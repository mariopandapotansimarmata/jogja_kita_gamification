import 'package:flutter/material.dart';

class PriceCardOrder extends StatelessWidget {
  const PriceCardOrder(
      {super.key,
      required this.icon,
      required this.name,
      required this.price,
      required this.isBordered});

  final IconData icon;
  final String name;
  final String price;
  final bool isBordered;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 75,
      decoration: BoxDecoration(
          color: isBordered ? const Color(0xffFCE7E9) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: isBordered
              ? Border.all(color: const Color(0xffC21515))
              : Border.all(color: Colors.transparent, width: 0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 52,
            color: const Color(0xffB30F10),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "9 Menit",
                      style: TextStyle(
                          color: Color.fromARGB(255, 111, 111, 111),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
