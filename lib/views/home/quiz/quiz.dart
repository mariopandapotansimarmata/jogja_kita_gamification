import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/view_model/quiz_view_model.dart';
import 'package:jogja_kita_gamification/view_model/user_view_model.dart';
import 'package:jogja_kita_gamification/views/component/profile_badges.dart';
import 'package:jogja_kita_gamification/views/home/quiz/quiz_widget/button_answer.dart';
import 'package:jogja_kita_gamification/views/home/quiz/quiz_widget/result_overlay.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:provider/provider.dart';

import '../../../core/model/quiz_model.dart';
import '../../order/active_order/active_order.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage(
      {super.key, required this.listQuiz, required this.indexQuestion});
  final int indexQuestion;
  final List<QuizModel> listQuiz;
  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final GlobalKey<ScaffoldMessengerState> scaffoldErrorQuizMessenger =
      GlobalKey<ScaffoldMessengerState>();

  int _selectedAnswerIndex = -1;

  @override
  Widget build(BuildContext context) {
    var quizVM = context.watch<QuizViewModel>();
    var user = context.read<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
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
                SizedBox(
                  height: 80,
                  child: Center(
                    child: Text(
                        "${widget.listQuiz[widget.indexQuestion].question}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${widget.indexQuestion + 1} ",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("dari ${widget.listQuiz.length}"),
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
                Column(
                  children: [
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final question =
                              widget.listQuiz[widget.indexQuestion];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedAnswerIndex = index;
                              });
                            },
                            child: ButtonAnswerQuizz(
                              answer: question.listChoices![index]!,
                              isSelected: _selectedAnswerIndex == index,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 10,
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    const Column(
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
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        _selectedAnswerIndex = -1;
                      }),
                      child: const Column(
                        children: [Icon(Icons.refresh), Text("Reset")],
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 68,
                    width: MediaQuery.of(context).size.width,
                    child: widget.indexQuestion == (widget.listQuiz.length - 1)
                        ? ElevatedButton(
                            onPressed: () async {
                              if (_selectedAnswerIndex >= 0) {
                                if (quizVM.listQuestion[widget.indexQuestion]
                                        .correctAnswer ==
                                    quizVM.listQuestion[widget.indexQuestion]
                                        .listChoices![_selectedAnswerIndex]) {
                                  quizVM.setTotalScoreAnswer = 1;
                                } else {}
                                var overlayCompleter = Completer<void>();
                                await OverlayLoadingProgress.start(
                                  context,
                                  widget: ResultOverlay(onComplete: () {
                                    overlayCompleter.complete();
                                  }),
                                );
                                await overlayCompleter.future;

                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              } else {
                                scaffoldMessengerKey.currentState?.showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Color(0xffCA110F),
                                    content: Row(
                                      children: [
                                        Text('Silahkan pilih jawaban'),
                                      ],
                                    ),
                                  ),
                                );
                              }

                              user.currentUser!.setExp =
                                  (quizVM.totalCorrectAnswer * 5);
                              await user.updateUser(user.currentUser!);
                              quizVM.setTotalScoreToZero();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text("Submit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (_selectedAnswerIndex >= 0) {
                                if (quizVM.listQuestion[widget.indexQuestion]
                                        .correctAnswer ==
                                    quizVM.listQuestion[widget.indexQuestion]
                                        .listChoices![_selectedAnswerIndex]) {
                                  quizVM.setTotalScoreAnswer = 1;
                                }
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return QuizzPage(
                                        listQuiz: widget.listQuiz,
                                        indexQuestion:
                                            widget.indexQuestion + 1);
                                  },
                                ));
                              } else {
                                scaffoldMessengerKey.currentState?.showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Color(0xffCA110F),
                                    content: Row(
                                      children: [
                                        Text('Silahkan pilih jawaban'),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffF2D726),
                            ),
                            child: const Text("Next",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
