import 'package:jogja_kita_gamification/model/quiz_model.dart';

import 'db.dart';

class QuizDB {
  JogjaKitaDb jogjaKitaDb = JogjaKitaDb.instance;
  static final QuizDB instance = QuizDB._();

  static const String tableName = "quiz";

  QuizDB._();

  Future<List<QuizModel>> readAll() async {
    final db = await jogjaKitaDb.database;
    final result = await db.query(
      tableName,
      columns: [
        "question, first_choice, second_choice, third_choice, forth_choice, correct_answer, question_package"
      ],
    );
    if (result.isNotEmpty) {
      return result.map((json) => QuizModel.fromJson(json)).toList();
    } else {
      throw Exception('Quiz not found');
    }
  }

  Future<List<QuizModel>> readAllByQRCode(String questionPackage) async {
    final db = await jogjaKitaDb.database;
    final result = await db.query(
      tableName,
      where: "question_package = ?",
      whereArgs: [questionPackage],
      columns: [
        "question, first_choice, second_choice, third_choice, forth_choice, correct_answer, question_package"
      ],
    );

    return result.map((json) => QuizModel.fromJson(json)).toList();
  }

  Future<bool> checkQuestionPackage(String questionPackage) async {
    final db = await jogjaKitaDb.database;
    final result = await db.query(
      tableName,
      where: "question_package = ?",
      whereArgs: [questionPackage],
      distinct: true,
      columns: ["question_package"],
    );
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
