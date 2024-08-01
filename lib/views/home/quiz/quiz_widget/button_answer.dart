import 'package:flutter/material.dart';

class ButtonAnswerQuizz extends StatefulWidget {
  const ButtonAnswerQuizz(
      {super.key, this.isSelected = false, required this.answer});
  final bool isSelected;
  final String answer;
  @override
  State<ButtonAnswerQuizz> createState() => _ButtonAnswerQuizzState();
}

class _ButtonAnswerQuizzState extends State<ButtonAnswerQuizz> {
  final Color activeColor = const Color(0xffCA110F);
  final Color netralColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 68,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isSelected ? Colors.white : Colors.grey),
            color: widget.isSelected ? activeColor : netralColor,
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            widget.answer,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
