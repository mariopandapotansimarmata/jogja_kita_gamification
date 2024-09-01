import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../component/profile_badges.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({super.key, required this.user});
  final UserModel user;
  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[700],
        centerTitle: true,
        title: const Text(
          "Detail Users",
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.user.name!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(widget.user.userName!,
                    style: const TextStyle(
                      fontSize: 14,
                    )),
                ProfileBadges(
                  exp: widget.user.exp!,
                  size: 60,
                ),
                Column(
                  children: [
                    Text(
                      widget.user.badge!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.user.exp!.toString()} ",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.control_camera_rounded,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
