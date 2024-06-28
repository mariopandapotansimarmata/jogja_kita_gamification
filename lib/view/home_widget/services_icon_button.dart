import 'package:flutter/material.dart';

class ServiceIconButton extends StatefulWidget {
  const ServiceIconButton({super.key});

  @override
  State<ServiceIconButton> createState() => _ServiceIconButtonState();
}

class _ServiceIconButtonState extends State<ServiceIconButton> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(
                Icons.abc,
                size: 50,
              ),
              Text("JogjaRide")
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.abc,
                size: 50,
              ),
              Text("JogjaRide")
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.abc,
                size: 50,
              ),
              Text("JogjaRide")
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.abc,
                size: 50,
              ),
              Text("JogjaRide")
            ],
          ),
        ],
      ),
    );
  }
}
