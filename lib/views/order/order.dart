import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/order/active_order/active_order.dart';
import 'package:jogja_kita_gamification/views/order/history_order/history_order.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Color mainColor = const Color(0xffAB1F21);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Pesanan',
                style: TextStyle(
                    color: Color(0xff5F5151),
                    fontWeight: FontWeight.w900,
                    fontSize: 16)),
            bottom: TabBar(
              indicatorColor: mainColor,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,
              padding: const EdgeInsets.all(0),
              tabAlignment: TabAlignment.fill,
              labelStyle: TextStyle(
                  color: mainColor, fontSize: 16, fontWeight: FontWeight.w900),
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Tab(
                    text: "Pesanan Aktif",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Tab(
                    text: "Riwayat Pesanan",
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              ActiveOrder(),
              HistoryOrder(),
            ],
          ),
        ),
      ),
    );
  }
}
