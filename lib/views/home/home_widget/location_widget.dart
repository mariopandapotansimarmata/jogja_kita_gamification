import 'package:flutter/material.dart';

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
          Container(
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
          Container(
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
                padding: EdgeInsetsDirectional.only(top: 10),
                height: MediaQuery.of(context).size.height * 0.08,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileBadges(),
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

class ProfileBadges extends StatelessWidget {
  const ProfileBadges({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Color(0xff36AE7C), width: 4),
              color: const Color(0xffCAC6C5)),
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 50,
          )),
    ]);
  }
}
