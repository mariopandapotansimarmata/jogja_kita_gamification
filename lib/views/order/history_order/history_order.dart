import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/view_model/order_view_model.dart';
import 'package:jogja_kita_gamification/views/component/form_field_text.dart';
import 'package:jogja_kita_gamification/views/order/history_order/history_order_widget/history_order_widget.dart';
import 'package:provider/provider.dart';

import '../../../model/order_model.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({super.key});

  @override
  State<HistoryOrder> createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
  @override
  void initState() {
    context.read<OrderViewModel>().showAllFinishOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderVM = context.watch<OrderViewModel>();
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
          height: MediaQuery.of(context).size.height * 0.55,
          child: orderVM.listFinishOrders.isEmpty
              ? Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(right: 20),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        width: 150,
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/food-delivery.png'))),
                    const Text(
                      'Tidak ada riwayat pesanan',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: orderVM.listFinishOrders.length,
                  itemBuilder: (context, index) {
                    OrderModel order = orderVM.listFinishOrders[index];
                    return InkWell(
                      onLongPress: () {
                        setState(() {
                          orderVM.listFinishOrders.removeAt(index);
                          context.read<OrderViewModel>().deleteOrder(order);
                        });
                      },
                      child: Column(
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
                      ),
                    );
                  }),
        ),
      ],
    );
  }
}
