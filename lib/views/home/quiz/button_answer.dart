import 'package:flutter/material.dart';

class ButtonAnswerQuizz extends StatefulWidget {
  const ButtonAnswerQuizz({super.key});

  @override
  State<ButtonAnswerQuizz> createState() => _ButtonAnswerQuizzState();
}

class _ButtonAnswerQuizzState extends State<ButtonAnswerQuizz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 68,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
      child: const Center(
        child: Text(
          "1755",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
