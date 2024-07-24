import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/main.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExpBar extends StatefulWidget {
  const ExpBar({super.key});

  @override
  State<ExpBar> createState() => _ExpBarState();
}

class _ExpBarState extends State<ExpBar> {
  double getMaxExp(int exp) {
    if (exp <= 250) {
      return 250;
    } else if (exp <= 600) {
      return 600;
    } else if (exp <= 1000) {
      return 1000;
    } else {
      return 1000; // Add further conditions if there are more levels
    }
  }

  @override
  Widget build(BuildContext context) {
    final int currentExp = currentUser!.exp!;
    final double maxExp = getMaxExp(currentExp);
    final double percent = (currentExp / maxExp).clamp(0.0, 1.0);

    return LinearPercentIndicator(
      leading: Image.asset(
        "assets/badges-red.png",
        width: 25,
      ),
      alignment: MainAxisAlignment.spaceEvenly,
      animation: true,
      lineHeight: 24.0,
      animationDuration: 2500,
      percent: percent,
      center: Text(
        "$currentExp / $maxExp",
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
      ),
      barRadius: const Radius.circular(20),
      progressColor: Colors.blue,
      trailing: Image.asset(
        "assets/badges-amber.png",
        width: 25,
      ),
    );
  }
}
