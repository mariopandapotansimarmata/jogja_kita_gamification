import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jogja_kita_gamification/view_model/user_view_model.dart';
import 'package:jogja_kita_gamification/views/home/quiz/qr_code_scanner.dart';
import 'package:provider/provider.dart';

class BonusCard extends StatefulWidget {
  const BonusCard({super.key});

  @override
  State<BonusCard> createState() => _BonusCardState();
}

class _BonusCardState extends State<BonusCard> {
  var f = NumberFormat("#,###,000");
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                          ),
                          Text(
                            "${f.format(context.watch<UserViewModel>().currentUser!.poin)}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
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
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const QRViewExample();
                    },
                  ));
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
