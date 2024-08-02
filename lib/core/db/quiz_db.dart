import 'package:jogja_kita_gamification/core/model/quiz_model.dart';

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
        "question, first_choice, second_choice, third_choice, forth_choice, correct_answer"
      ],
    );
    if (result.isNotEmpty) {
      return result.map((json) => QuizModel.fromJson(json)).toList();
    } else {
      throw Exception('Quiz not found');
    }
  }
}
