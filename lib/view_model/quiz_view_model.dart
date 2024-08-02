import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/quiz_db.dart';
import 'package:jogja_kita_gamification/core/model/quiz_model.dart';

class QuizViewModel extends ChangeNotifier {
  final QuizDB quizDb = QuizDB.instance;
  int totalCorrectAnswer = 0;
  List<QuizModel> listQuestion = [];

  set setTotalScoreAnswer(int score) {
    totalCorrectAnswer = totalCorrectAnswer + score;
  }

  void setTotalScoreToZero() {
    totalCorrectAnswer = 0;
  }

  Future<void> showAllQuestion() async {
    final questions = await quizDb.readAll();
    listQuestion = questions;
    notifyListeners();
  }
}
