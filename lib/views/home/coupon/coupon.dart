import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/core/db/coupon_db.dart';
import 'package:jogja_kita_gamification/core/model/coupon_model.dart';
import 'package:jogja_kita_gamification/views/component/profile_badges.dart';
import 'package:jogja_kita_gamification/views/home/coupon/coupon_widget.dart';
import 'package:provider/provider.dart';

import '../../../view_model/user_view_model.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({super.key});

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  CouponDb couponDb = CouponDb.instance;
  List<CouponModel> listCoupons = [];

  Future<void> showAllCoupons() async {
    final coupons = await couponDb.readAll();
    setState(() {
      listCoupons = coupons;
    });
  }

  @override
  void initState() {
    showAllCoupons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: const Color(0xffCA110F),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ProfileBadges(
              exp: context.watch<UserViewModel>().currentUser!.exp!,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
        title: const Text(
          "Kupon",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: listCoupons.isEmpty
            ? Container(
                margin: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Kupon",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Gunakan kuponmu untuk mendapatkan potongan harga!",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Image.asset(
                                "assets/no-coupon.png",
                                width: 100,
                              ),
                            ),
                            const Text(
                              "tidak ada Coupon",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: MediaQuery.of(context).size.height * 0.86,
                    child: ListView.builder(
                      itemCount: listCoupons.length,
                      itemBuilder: (context, index) {
                        final coupon = listCoupons[index];
                        return index == 0
                            ? Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Kupon",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "Gunakan kuponmu untuk mendapatkan potongan harga!",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 9),
                                      child: CouponCard(
                                        coupon: coupon,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : CouponCard(coupon: coupon);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
