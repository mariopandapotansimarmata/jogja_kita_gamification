import 'package:flutter/material.dart';

class FormFieldText extends StatelessWidget {
  const FormFieldText(
      {super.key,
      required this.icon,
      this.name,
      this.iconColor = const Color.fromARGB(255, 116, 115, 116)});

  final IconData icon;
  final Color? iconColor;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 30, bottom: 20),
      height: 49,
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 122, 108, 112),
          ),
          hintText: name,
          prefixIcon: Icon(
            color: iconColor,
            icon,
            size: 30,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 230, 228, 228),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
    );
  }
}
