import 'package:flutter/material.dart';

class CardFollower extends StatelessWidget {
  const CardFollower({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "0",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "Mengikuti",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
