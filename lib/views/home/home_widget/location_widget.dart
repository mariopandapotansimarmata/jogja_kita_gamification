import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/main.dart';

import '../../component/profile_badges.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height * 0.125,
      decoration: const BoxDecoration(color: Color(0xffCA110F)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.5 - 16,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lokasi Anda",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text("Kios Ngabean",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ],
            ),
          ),
          SizedBox(
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: MediaQuery.of(context).size.width * 0.3,
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.only(top: 10),
                height: MediaQuery.of(context).size.height * 0.082,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileBadges(
                      exp: currentUser!.exp!,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
