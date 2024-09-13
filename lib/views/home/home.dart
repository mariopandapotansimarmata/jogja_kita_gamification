import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/model/user_model.dart';
import 'package:jogja_kita_gamification/view_model/coupon_view_model.dart';
import 'package:jogja_kita_gamification/view_model/order_view_model.dart';
import 'package:jogja_kita_gamification/views/home/coupon/coupon.dart';

import 'package:jogja_kita_gamification/views/home/home_widget/bonus_card.dart';
import 'package:jogja_kita_gamification/views/home/jogja_food/jogja_food.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/jogja_ride.dart';
import 'package:provider/provider.dart';

import '../../view_model/user_view_model.dart';
import 'home_widget/location_widget.dart';
import 'home_widget/recomendation.dart';
import 'home_widget/services_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (context.watch<UserViewModel>().currentUser == null) {
      return const CircularProgressIndicator();
    }
    UserModel currentUser = context.read<UserViewModel>().currentUser!;
    context.read<CouponViewModel>().generateCoupon(currentUser);
    return ListView(children: [
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Anda memiliki quest harian",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffCA110F),
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CouponPage(),
                                ));
                          },
                          child: const Text(
                            "Kupon",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const JogjaRide(
                                    initialService: true,
                                  );
                                },
                              ));
                            },
                            child: const ServiceIcon(
                                name: "Jogja Ride",
                                icon: Icons.directions_bike),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const JogjaRide(
                                    initialService: false,
                                  );
                                },
                              ));
                            },
                            child: const ServiceIcon(
                                name: "Jogja Car", icon: Icons.car_repair),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const JogjaFood();
                                },
                              ));
                            },
                            child: const ServiceIcon(
                                name: "Jogja Food", icon: Icons.fastfood),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<OrderViewModel>()
                                  .isActiveOrdersExist();
                            },
                            child: const ServiceIcon(
                                name: "Jogja Kurir", icon: Icons.pages),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ServiceIcon(name: "Jogja Toko", icon: Icons.store),
                          ServiceIcon(name: "Jogja Pay", icon: Icons.payments),
                          ServiceIcon(
                              name: "Jogja Shop", icon: Icons.shopping_bag),
                          ServiceIcon(
                              name: "Misi", icon: Icons.track_changes_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          "Istimewa Buatmu",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    // margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: MediaQuery.of(context).size.width - 32,
                            child: const Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/promo_banner.png')));
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const RecomendationResto(
                name: "Resto Terdekat",
              ),
              const SizedBox(
                height: 20,
              ),
              const RecomendationResto(
                name: "Sedang Promo",
              )
            ],
          ),
          const LocationWidget(),
          // Text(context.watch<UserViewModel>().currentUser!.name!),
          const BonusCard()
        ],
      ),
      const SizedBox(
        height: 40,
      )
    ]);
  }
}
