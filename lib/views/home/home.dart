import 'package:flutter/material.dart';

import 'package:jogja_kita_gamification/views/home/home_widget/bonus_card.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/jogja_ride.dart';

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
    return ListView(children: [
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.19,
              ),
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
                            return const DraggableScrollableSheetExampleApp();
                          },
                        ));
                      },
                      child: const ServiceIcon(
                          name: "Jogja Ride", icon: Icons.directions_bike),
                    ),
                    const ServiceIcon(
                        name: "Jogja Car", icon: Icons.car_repair),
                    const ServiceIcon(name: "Jogja Food", icon: Icons.fastfood),
                    const ServiceIcon(name: "Jogja Kurir", icon: Icons.pages),
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
                    ServiceIcon(name: "Jogja Shop", icon: Icons.shopping_bag),
                    ServiceIcon(
                        name: "Misi", icon: Icons.track_changes_outlined),
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
              const RecomendationResto(),
              const SizedBox(
                height: 20,
              ),
              const RecomendationResto()
            ],
          ),
          const LocationWidget(),
          const BonusCard()
        ],
      ),
      const SizedBox(
        height: 40,
      )
    ]);
  }
}
