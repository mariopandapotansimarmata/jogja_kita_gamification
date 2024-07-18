import 'package:flutter/material.dart';

class BottomPayment extends StatelessWidget {
  const BottomPayment({super.key, required this.name, required this.icon});
  final String name;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black54))),
      width: MediaQuery.of(context).size.width * 0.375,
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
