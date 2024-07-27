import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogja_ride.dart';

import '../../../core/model/coupon_model.dart';
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
              // border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text(
                    "50",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Icon(
                    Icons.control_camera_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                ],
              ),
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
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
              // color: Color(0xffF87474),
              border: Border.all(color: Colors.black),
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
                          return OrderJogjaRide(
                            coupon: coupon,
                          );
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
