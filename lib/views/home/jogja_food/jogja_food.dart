import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/home/jogja_food/order_jogja_food.dart';

import '../home_widget/services_icon_button.dart';

class JogjaFood extends StatefulWidget {
  const JogjaFood({super.key});

  @override
  State<JogjaFood> createState() => _JogjaFoodState();
}

class _JogjaFoodState extends State<JogjaFood> {
  Color redColor = const Color(0xffCA110F);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: redColor,
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              color: redColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Antar makanan ke",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "Jl.lely III",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIconColor: Colors.grey,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Cari nama resto atau menu",
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white),
                      ))
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mau makan apa hari ini ?",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const OrderJogjaFood();
                              },
                            ));
                          },
                          child: const ServiceIcon(
                              name: "Terdekat", icon: Icons.pin_drop)),
                      const ServiceIcon(
                          name: "Populer", icon: Icons.card_giftcard),
                      const ServiceIcon(name: "Rating", icon: Icons.star),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ServiceIcon(
                          name: "Lagi Promo", icon: Icons.discount_outlined),
                      ServiceIcon(name: "Murah", icon: Icons.celebration_sharp),
                      ServiceIcon(
                          name: "Disimpan", icon: Icons.filter_list_sharp),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resto Populer dikotamu",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
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
                                blurRadius: 1,
                                offset: Offset(0, 0.5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.all(5),
                          height: 245,
                          width: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16)),
                                // height: 155,
                                // width: 147,
                                child: const Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/resto_pic.png')),
                              ),
                              const Expanded(
                                child: Text(
                                  "Mie Gacoan",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
