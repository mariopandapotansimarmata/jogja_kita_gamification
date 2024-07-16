import 'package:flutter/material.dart';

class ActiveOrderIcon extends StatelessWidget {
  const ActiveOrderIcon({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + 9,
      width: size + 9,
      decoration: BoxDecoration(
          color: const Color(0xffFCE7E9),
          borderRadius: BorderRadius.circular(50)),
      child: Icon(
        Icons.fastfood,
        size: size,
        color: const Color(0xffB30F10),
      ),
    );
  }
}

class DriverProfileIcon extends StatelessWidget {
  const DriverProfileIcon({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + 3,
      width: size + 3,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(50)),
      child: Icon(
        Icons.person,
        size: size,
        color: Colors.white,
      ),
    );
  }
}

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key, required this.size, required this.icon});
  final double size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + 15,
      width: size + 15,
      decoration: BoxDecoration(
          color: Color(0xffD53737), borderRadius: BorderRadius.circular(50)),
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
    );
  }
}
