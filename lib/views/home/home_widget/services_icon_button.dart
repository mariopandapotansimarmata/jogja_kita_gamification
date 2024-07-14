import 'package:flutter/material.dart';

class ServiceIcon extends StatelessWidget {
  const ServiceIcon({super.key, required this.name, required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 79,
      width: 79,
      child: Column(
        children: [
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: const Color(0xffFCE7E9),
                borderRadius: BorderRadius.circular(50)),
            child: Icon(
              icon,
              size: 37,
              color: const Color(0xffB30F10),
            ),
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 59, 52, 53)),
          )
        ],
      ),
    );
  }
}
