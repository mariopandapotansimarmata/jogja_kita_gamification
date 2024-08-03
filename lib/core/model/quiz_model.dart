class QuizModel {
  final int? quizId;
  final String? question;
  final List<String?>? listChoices;
  final String? correctAnswer;
  final String? questionPackage;

  QuizModel(
      {this.quizId,
      this.question,
      this.listChoices,
      this.correctAnswer,
      this.questionPackage});

  factory QuizModel.fromJson(Map<String?, Object?> json) => QuizModel(
      quizId: json["quiz_id"] as int?,
      question: json["question"] as String?,
      listChoices: [
        json["first_choice"] as String?,
        json["second_choice"] as String?,
        json["third_choice"] as String?,
        json["forth_choice"] as String?
      ],
      correctAnswer: json["correct_answer"] as String?,
      questionPackage: json["question_package"] as String?);
}
