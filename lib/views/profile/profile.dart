import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/model/user_model.dart';
import 'package:jogja_kita_gamification/main_view_model.dart';
import 'package:jogja_kita_gamification/views/component/profile_badges.dart';
import 'package:jogja_kita_gamification/views/profile/profile_widget/card_follower.dart';
import 'package:jogja_kita_gamification/views/profile/profile_widget/exp_bar.dart';
import 'package:jogja_kita_gamification/views/profile/profile_widget/profile_navbar.dart';
import 'package:jogja_kita_gamification/views/profile/profile_widget/video_views.dart/leaderboard.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilePage> {
  late UserModel user;
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = context.watch<MainViewModel>().currentUser!;

    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.name!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(user.userName!,
                          style: const TextStyle(
                            fontSize: 14,
                          )),
                    ],
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: const Icon(
                        Icons.more_horiz,
                        size: 40,
                        color: Color(0xff5F5151),
                      )),
                ],
              ),
              ProfileBadges(
                exp: context.watch<MainViewModel>().currentUser!.exp!,
                size: 60,
              ),
              const SizedBox(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardFollower(),
                    CardFollower(),
                    CardFollower(),
                  ],
                ),
              ),
              ExpBar(
                user: user,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 42,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: Color(0xffB30F10)),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: const Text(
                          "Sunting Profile",
                          style: TextStyle(color: Color(0xffB30F10)),
                        )),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffB30F10)),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.share,
                      color: Color(0xffB30F10),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const Row(
          children: [
            ProfileNavbar(
              label: "Video Kamu",
              selected: false,
            ),
            ProfileNavbar(
              label: "Video Disukai",
              selected: false,
            ),
            ProfileNavbar(
              label: "LeaderBoard",
              selected: true,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.42,
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: const Leaderboard(),
        )
      ],
    );
  }
}
