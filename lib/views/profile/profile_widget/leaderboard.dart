import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/component/profile_badges.dart';
import 'package:jogja_kita_gamification/views/profile/detail_profile.dart';
import 'package:provider/provider.dart';

import '../../../view_model/user_view_model.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  void initState() {
    context.read<UserViewModel>().readAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var usersVM = context.watch<UserViewModel>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          itemCount: usersVM.usersList.length,
          itemBuilder: (context, index) {
            final user = usersVM.usersList[index];

            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailProfile(
                      user: user,
                    );
                  },
                ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 25,
                                  child: Text(
                                    "${index + 1}.",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                ProfileBadges(
                                  exp: user.exp!,
                                  size: 30,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                "${user.name}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${user.badge}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.control_camera_outlined,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
