import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/home/jogja_food/order_jogja_food.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride.dart';

import '../../../model/coupon_model.dart';
import '../../order/active_order/active_order_widget/order_icons.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({super.key, required this.coupon});

  final CouponModel coupon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 145,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 236, 32, 59),
                  Color.fromARGB(255, 192, 105, 105)
                ],
              ),
              color: Color.fromARGB(255, 236, 32, 59),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ActiveOrderIcon(
                      size: 50,
                      icon: coupon.couponCategory == "ride"
                          ? Icons.directions_bike
                          : Icons.fastfood),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        coupon.couponName!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      const Text(
                        "Minimal transaksi 30rb",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          height: 50,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
              // color: Color(0xffF87474),
              border: Border.all(color: Colors.black54),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Berlaku Sampai 24 Jam",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: const Color(0xffCA110F),
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          if (coupon.couponCategory == "food") {
                            return OrderJogjaFood(
                              coupon: coupon,
                            );
                          } else {
                            return OrderJogjaRide(
                              initialService: false,
                              coupon: coupon,
                            );
                          }
                        },
                      ));
                    },
                    child: const Text(
                      "Pakai",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
