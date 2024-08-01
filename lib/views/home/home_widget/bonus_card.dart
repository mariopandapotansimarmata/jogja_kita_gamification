import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/model/quiz_model.dart';
import 'package:jogja_kita_gamification/views/home/quiz/quiz.dart';

class BonusCard extends StatefulWidget {
  const BonusCard({super.key});

  @override
  State<BonusCard> createState() => _BonusCardState();
}

class _BonusCardState extends State<BonusCard> {
  List<QuizModel> dummyData = [
    QuizModel(question: "soal 1", listChoices: ["1 a", "1 b", "1 c", "1 d"]),
    QuizModel(question: "soal 2", listChoices: ["2 a", "2 b", "2 c", "2 d"]),
    QuizModel(question: "soal 3", listChoices: ["3 a", "3 b", "3 c", "3 d"]),
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.125 -
            ((MediaQuery.of(context).size.height * 0.075) / 2),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: MediaQuery.of(context).size.height * 0.075,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width - 32,
          // height: MediaQuery.of(context).size.height * 0.,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.38,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                          ),
                          Text(
                            "100.000",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Pakai Bonusmu",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: Colors.grey))),
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.fingerprint,
                          color: Colors.blue,
                        ),
                        Text(
                          "SpeedCash",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "Aktifkan Saldo",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return QuizzPage(
                      indexQuestion: 0,
                      listQuiz: dummyData,
                    );
                  }));
                },
                child: const Icon(
                  Icons.qr_code_scanner_rounded,
                  size: 40,
                ),
              )
            ],
          ),
        ));
  }
}
