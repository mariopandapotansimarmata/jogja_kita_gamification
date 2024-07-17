import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/home/home.dart';
import 'package:jogja_kita_gamification/views/home/jogja_ride/order_jogj_ride.dart';
import 'package:jogja_kita_gamification/views/order/order.dart';
import 'package:jogja_kita_gamification/views/profile/profile.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

//

class _ScreenState extends State<Screen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          child: BottomNavigationBar(
            elevation: 0,
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            iconSize: 25,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill),
                label: 'Video',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_call),
                label: 'Posting',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Posting',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xffB30F10),
            onTap: _onItemTapped,
          ),
        ),
        appBar: _selectedIndex == 0
            ? AppBar(
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
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                )),
        body: <Widget>[
          const HomePage(),
          const HomePage(),
          OrderJogjaRide(),
          const OrderPage(),
          const ProfilePage()
        ][_selectedIndex]);
  }
}
