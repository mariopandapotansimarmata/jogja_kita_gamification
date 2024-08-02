import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/view_model/quiz_view_model.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:provider/provider.dart';

class ResultOverlay extends StatelessWidget {
  const ResultOverlay({super.key, required this.onComplete});
  final VoidCallback onComplete;
  @override
  Widget build(BuildContext context) {
    var quizVM = context.watch<QuizViewModel>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const CircularProgressIndicator(),
            Container(
              height: 200,
              width: 300,
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Selamat",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Anda mendapatkan Exp",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      "${quizVM.totalCorrectAnswer}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  onComplete();
                  OverlayLoadingProgress.stop();
                },
                child: const Text("Tutup"))
          ],
        ),
      ),
    );
  }
}
