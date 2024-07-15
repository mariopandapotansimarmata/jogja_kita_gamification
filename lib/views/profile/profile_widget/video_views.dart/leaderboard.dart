import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/component/profile_badges.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        // width: MediaQuery.of(context).size.width * 0.8,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 9),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                            const Text(
                              "Mario Pandapotan Simarmata",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Text(
                          "8450",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
