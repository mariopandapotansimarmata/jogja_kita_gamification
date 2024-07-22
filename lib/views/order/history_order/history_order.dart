import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/component/form_field_text.dart';
import 'package:jogja_kita_gamification/views/order/history_order/history_order_widget/history_order_widget.dart';

import '../../../core/db/order_db.dart';
import '../../../core/model/order_model.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({super.key});

  @override
  State<HistoryOrder> createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
  OrderDb orderDb = OrderDb.instance;
  List<OrderModel> listOrders = [];

  @override
  void initState() {
    showAllOrders();
    super.initState();
  }

  Future<void> showAllOrders() async {
    final orders = await orderDb.readAll();
    setState(() {
      listOrders = orders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, bottom: 20),
          child: const FormFieldText(
            icon: Icons.search,
            name: 'Cari resto, menu, tujuan',
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Riwayat Pesanan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            Text(
              "CLBK sama menu yang sama atau kembali ketujuan masa lalu? Pesan lagi!",
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 400,
          child: listOrders.isEmpty
              ? const Text("No Data Found")
              : ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    OrderModel order = listOrders[index];
                    return Column(
                      children: [
                        HistoryOrderCard(
                          icon: order.orderCategory == "ride"
                              ? Icons.directions_bike
                              : Icons.fastfood,
                          orderId: order.orderId!,
                          amount: order.amount!,
                          dateTime: order.dateTime!,
                          orderCategory: order.orderCategory!,
                          orderName: order.orderName!,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 42,
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffAB1F21),
                                    shadowColor: Colors.transparent),
                                child: const Text(
                                  "Pesan Lagi",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        )
                      ],
                    );
                  }),
        ),
      ],
    );
  }
}
