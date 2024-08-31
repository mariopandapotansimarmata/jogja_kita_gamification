import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/quiz_db.dart';
import 'package:jogja_kita_gamification/model/quiz_model.dart';

class QuizViewModel extends ChangeNotifier {
  final QuizDB quizDb = QuizDB.instance;
  int totalCorrectAnswer = 0;
  List<QuizModel> listQuestion = [];

  int quizTime = 15;

  set setTotalScoreAnswer(int score) {
    totalCorrectAnswer = totalCorrectAnswer + score;
  }

  void setTotalScoreToZero() {
    totalCorrectAnswer = 0;
  }

  Future<void> showAllQuestion() async {
    final questions = await quizDb.readAll();
    listQuestion = [];
    listQuestion = questions;
    notifyListeners();
  }

  Future<void> showQuestionsByQR(String questionPackage) async {
    final questions = await quizDb.readAllByQRCode(questionPackage);
    listQuestion = [];
    if (questions.isNotEmpty) {
      listQuestion = questions;
      notifyListeners();
    }
  }

  Future<bool> isQuestionPackageExist(String questionPackage) async {
    return await quizDb.checkQuestionPackage(questionPackage);
  }
}
