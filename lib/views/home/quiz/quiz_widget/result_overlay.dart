import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class ResultOverlay extends StatelessWidget {
  const ResultOverlay({super.key, required this.onComplete});
  final VoidCallback onComplete;
  @override
  Widget build(BuildContext context) {
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
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Selamat",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Anda mendapatkan Exp",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      "",
                      style: TextStyle(
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
