import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/user_db.dart';
import 'package:jogja_kita_gamification/core/model/user_model.dart';
import 'package:jogja_kita_gamification/screen.dart';

import 'views/order/active_order/active_order.dart';

UserModel? currentUser;

UserDb userDb = UserDb.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  currentUser = await userDb.read("mario_pan");
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
