import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/order/history_order/history_order_widget/history_order_widget.dart';

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, bottom: 20),
          height: 49,
          child: TextFormField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 135, 131, 132),
              ),
              hintText: "Cari resto, menu, atau tujuan.",
              prefixIcon: Icon(
                color: Color.fromARGB(255, 161, 155, 156),
                Icons.search,
                size: 30,
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 230, 228, 228),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pesanan Aktif",
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
        const HistoryOrderCard(),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 42,
          width: MediaQuery.of(context).size.width * 0.8,
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
      ],
    );
  }
}
