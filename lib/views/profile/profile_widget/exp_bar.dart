import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExpBar extends StatelessWidget {
  const ExpBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      leading: const Icon(
        Icons.thumb_up,
        color: Color(0xff36AE7C),
      ),
      alignment: MainAxisAlignment.spaceEvenly,
      animation: true,
      lineHeight: 24.0,
      animationDuration: 2500,
      percent: 0.8,
      center: const Text(
        "80.0%",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
      ),
      barRadius: const Radius.circular(20),
      progressColor: Colors.blue,
      trailing: const Icon(Icons.thumb_up),
    );
  }
}
