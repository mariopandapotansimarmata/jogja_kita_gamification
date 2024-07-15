import 'package:flutter/material.dart';

class ProfileNavbar extends StatelessWidget {
  const ProfileNavbar({super.key, required this.label, required this.selected});
  final String label;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.33,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: selected
            ? const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2)))
            : const BoxDecoration(),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal),
        ));
  }
}
