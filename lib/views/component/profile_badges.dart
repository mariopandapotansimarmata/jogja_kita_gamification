import 'package:flutter/material.dart';

class ProfileBadges extends StatefulWidget {
  const ProfileBadges({super.key, this.size = 50, required this.exp});
  final double size;
  final int exp;

  @override
  State<ProfileBadges> createState() => _ProfileBadgesState();
}

class _ProfileBadgesState extends State<ProfileBadges> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: widget.size + 10,
          width: widget.size + 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: widget.exp < 250
                      ? Colors.green
                      : (widget.exp < 600
                          ? Colors.red
                          : (widget.exp < 1000 ? Colors.amber : Colors.indigo)),
                  width: widget.size <= 30 ? 2 : 4),
              color: const Color(0xffCAC6C5)),
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: widget.size,
          )),
    ]);
  }
}
