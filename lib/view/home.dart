import 'package:flutter/material.dart';

import 'package:jogja_kita_gamification/view/home_widget/bonus_card.dart';

import 'home_widget/location_widget.dart';
import 'home_widget/services_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffCA110F),
        leading: Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            width: 5,
            height: 5,
            child: const Image(image: AssetImage('assets/PUTIH.png'))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mail,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ),
      body: ListView(children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ServiceIcon(
                          name: "Jogja Ride", icon: Icons.directions_bike),
                      ServiceIcon(name: "Jogja Car", icon: Icons.car_repair),
                      ServiceIcon(name: "Jogja Food", icon: Icons.fastfood),
                      ServiceIcon(name: "Jogja Kurir", icon: Icons.pages),
                    ],
                  ),
                ),
                SizedBox(
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
                    Container(
                      // margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 200,
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              width: MediaQuery.of(context).size.width - 32,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/promo_banner.png')));
                        },
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const LocationWidget(),
            const BonusCard()
          ],
        ),
      ]),
    );
  }
}
