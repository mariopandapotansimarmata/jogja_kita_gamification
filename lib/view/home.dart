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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promo di sekitar anda",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text("Lihat Semua",
                          style: TextStyle(fontSize: 14, color: Colors.red))
                    ],
                  ),
                ),
                RecomendationResto(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Resto Terdekat",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text("Lihat Semua",
                          style: TextStyle(fontSize: 14, color: Colors.red))
                    ],
                  ),
                ),
                RecomendationResto()
              ],
            ),
            const LocationWidget(),
            const BonusCard()
          ],
        ),
        const SizedBox(
          height: 40,
        )
      ]),
    );
  }
}

class RecomendationResto extends StatelessWidget {
  const RecomendationResto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Promo di sekitar anda
      padding: const EdgeInsets.only(left: 8),
      height: 235,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(0.5, 1), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey)),
            margin: const EdgeInsets.all(5),
            height: 245,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  // height: 155,
                  // width: 147,
                  child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/recomendation.png')),
                ),
                const Expanded(
                  child: Text(
                    "Ayam Bakar P Widodo Galih, Wahid Hasyim, C",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Color(0xffCA110F),
                    ),
                    Text("3 KM")
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
