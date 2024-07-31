import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/view_model/user_view_model.dart';
import 'package:jogja_kita_gamification/views/component/profile_badges.dart';
import 'package:jogja_kita_gamification/views/home/quiz/button_answer.dart';
import 'package:provider/provider.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        leading: Container(child: const Icon(Icons.arrow_back)),
        actions: [
          Container(
              padding: const EdgeInsets.only(right: 16),
              child: ProfileBadges(
                  exp: context.read<UserViewModel>().currentUser!.exp!))
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  child: const Center(
                    child: const Text(
                        "Apa nama keraton atau istana resmi dari Sultan Yogyakarta",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "1 ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("dari 3"),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
              color: Color(0xffFAFAFA),
            ),
            height: MediaQuery.of(context).size.height * 0.64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    ButtonAnswerQuizz(),
                    ButtonAnswerQuizz(),
                    ButtonAnswerQuizz(),
                    ButtonAnswerQuizz(),
                    Column(
                      children: [
                        Icon(
                          Icons.control_camera_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "+5",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 68,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.grey),
                  //   color: Colors.white,
                  //   // borderRadius: BorderRadius.circular(16)
                  // ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF2D726),
                    ),
                    child: const Text("Next",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
