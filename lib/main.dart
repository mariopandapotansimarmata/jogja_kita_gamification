import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/user_db.dart';
import 'package:jogja_kita_gamification/core/model/user_model.dart';
import 'package:jogja_kita_gamification/screen.dart';

import 'views/home/jogja_ride/pickup_jogja_ride.dart';

UserModel? currentUser;

UserDb userDb = UserDb.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  currentUser = await userDb.read("mario");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const Screen(),
    );
  }
}
