import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/component/profile_badges.dart';

import '../../../../core/db/user_db.dart';
import '../../../../core/model/user_model.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  UserDb userDb = UserDb.instance;

  List<UserModel> usersList = [];

  @override
  void initState() {
    refreshNotes();
    super.initState();
  }

  // @override
  // void dispose() {
  //   userDb.jogjaKitaDb.close();
  //   super.dispose();
  // }

  Future<void> refreshNotes() async {
    final users = await userDb.readAll();
    setState(() {
      usersList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          itemCount: usersList.length,
          itemBuilder: (context, index) {
            final user = usersList[index];

            return Container(
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
                              Text(
                                "${index + 1}.",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              const ProfileBadges(
                                size: 30,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "${user.name}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        "${user.exp}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
