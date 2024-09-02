import 'package:flutter/material.dart';

class IconOjf extends StatefulWidget {
  const IconOjf({super.key});

  @override
  State<IconOjf> createState() => _IconOjfState();
}

class _IconOjfState extends State<IconOjf> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Column(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: const Color(0xffFCE7E9),
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.fastfood,
                  size: 25,
                  color: Color(0xffB30F10),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
