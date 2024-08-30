import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/view_model/coupon_view_model.dart';
import 'package:jogja_kita_gamification/view_model/order_view_model.dart';
import 'package:jogja_kita_gamification/screen.dart';
import 'package:jogja_kita_gamification/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'view_model/quiz_view_model.dart';
import 'views/order/active_order/active_order.dart';

void main() async {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'order_channel',
            channelName: 'orrder_channel',
            channelDescription: 'order_channel')
      ],
      debug: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => OrderViewModel()),
        ChangeNotifierProvider(create: (_) => CouponViewModel()),
        ChangeNotifierProvider(create: (_) => QuizViewModel()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'JogjaKita',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: const Screen(),
      ),
    );
  }
}
