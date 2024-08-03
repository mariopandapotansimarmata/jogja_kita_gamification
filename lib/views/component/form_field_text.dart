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
    return SizedBox(
      // margin: const EdgeInsets.only(top: 30, bottom: 20),
      height: 49,
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
          ),
          hintText: name,
          prefixIcon: Icon(
            color: iconColor,
            icon,
            size: 30,
          ),
          filled: true,
          fillColor: Colors.grey[200],
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
