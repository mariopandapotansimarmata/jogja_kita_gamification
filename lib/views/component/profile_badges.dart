import 'package:flutter/material.dart';

class ProfileBadges extends StatelessWidget {
  const ProfileBadges({super.key, this.size = 50});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: size + 10,
          width: size + 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: const Color(0xff36AE7C), width: 4),
              color: const Color(0xffCAC6C5)),
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: size,
          )),
    ]);
  }
}
