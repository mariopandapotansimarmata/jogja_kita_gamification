import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/model/user_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExpBar extends StatefulWidget {
  const ExpBar({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  State<ExpBar> createState() => _ExpBarState();
}

class _ExpBarState extends State<ExpBar> {
  String leading = "assets/badges-green.png";
  String trail = "assets/badges-red.png";
  int minExp = 0;

  double getMaxExp(int exp) {
    if (exp < 250) {
      leading = "assets/badges-green.png";
      trail = "assets/badges-red.png";
      minExp = 0;
      return 250;
    } else if (exp < 600) {
      leading = "assets/badges-red.png";
      trail = "assets/badges-amber.png";
      minExp = 250;
      return 600;
    } else if (exp < 1000) {
      trail = "assets/badges-indigo.png";
      minExp = 600;
      return 1000;
    } else {
      leading = "assets/badges-indigo.png";
      return 1000; // Add further conditions if there are more levels
    }
  }

  @override
  Widget build(BuildContext context) {
    final int currentExp = widget.user.exp!;
    final double maxExp = getMaxExp(currentExp);
    final double percent =
        ((currentExp - minExp) / (maxExp - minExp)).clamp(0.0, 1.0);
    print(minExp);
    return LinearPercentIndicator(
      leading: Image.asset(
        leading,
        width: 25,
      ),
      alignment: MainAxisAlignment.spaceEvenly,
      animation: true,
      lineHeight: 24.0,
      animationDuration: 2500,
      percent: percent < 1 ? percent : 1,
      center: Text(
        "$currentExp / $maxExp",
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
      ),
      barRadius: const Radius.circular(20),
      progressColor: Colors.blue,
      trailing: currentExp >= 1000
          ? const SizedBox(
              height: 25,
              width: 25,
            )
          : Image.asset(
              trail,
              width: 25,
            ),
    );
  }
}
