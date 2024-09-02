import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/views/home/coupon/coupon.dart';
import 'package:jogja_kita_gamification/views/home/jogja_food/order_jogja_food_widget/icon_ojf.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:provider/provider.dart';

import '../../../model/coupon_model.dart';
import '../../../view_model/coupon_view_model.dart';
import '../../../view_model/order_view_model.dart';
import '../../../view_model/user_view_model.dart';
import '../jogja_ride/order_jogja_ride_widget/bottom_payment.dart';
import '../jogja_ride/pickup_jogja_ride.dart';

class OrderJogjaFood extends StatefulWidget {
  const OrderJogjaFood({super.key, this.coupon});
  final CouponModel? coupon;

  @override
  State<OrderJogjaFood> createState() => _OrderJogjaFoodState();
}

class _OrderJogjaFoodState extends State<OrderJogjaFood> {
  bool light = false;
  Color redColor = const Color(0xffCA110F);

  @override
  void initState() {
    setState(() {
      context.read<OrderViewModel>().price =
          context.read<OrderViewModel>().jogjaFood;
      context.read<OrderViewModel>().refreshTotalPrice(widget.coupon);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orderViewModel = context.watch<OrderViewModel>();
    var couponViewModel = context.watch<CouponViewModel>();
    var user = context.watch<UserViewModel>().currentUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey[300],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Alamat Pengantaran",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ubah Alamat",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.green[800],
                            ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Jl. Lely III No.222",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "Jl. Lely III No.222, Perumnas Condong Catur, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Istimewah Yogyakarta",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.grey[600], fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey[300],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rangkuman Pesanan",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ubah Pesanan",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.green[800]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const IconOjf(),
                        Text(
                          "Mie Gacoan",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "1x",
                                style: TextStyle(color: redColor),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Mie Hompimpa lvl 1",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text("Rp. 15.000",
                              style: Theme.of(context).textTheme.titleSmall!),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.only(left: 36),
                        height: 40,
                        padding: const EdgeInsets.only(left: 8),
                        child: TextFormField(
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Colors.grey[300],
                              border: InputBorder.none,
                              hintText: "Tambah Catatan",
                              suffixIcon: const Icon(Icons.edit)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "1x",
                                style: TextStyle(color: redColor),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Mie Hompimpa lvl 1",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text("Rp. 15.000",
                              style: Theme.of(context).textTheme.titleSmall!),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.only(left: 36),
                        height: 40,
                        padding: const EdgeInsets.only(left: 8),
                        child: TextFormField(
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Colors.grey[300],
                              border: InputBorder.none,
                              hintText: "Tambah Catatan",
                              suffixIcon: const Icon(Icons.edit)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Exp  +50",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Icon(
                        Icons.control_camera_outlined,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 42,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            color: Colors.amber,
                            Icons.currency_bitcoin,
                            size: 30,
                          ),
                          Text(
                            "${user!.poin}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Switch(
                                // This bool value toggles the switch.
                                value: light,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  setState(() {
                                    light = value;
                                    if (light == true) {
                                      user.setPoin = -1000;
                                      orderViewModel.togglepoinDiscount(light);
                                      orderViewModel
                                          .refreshTotalPrice(widget.coupon);
                                    } else {
                                      setState(() {
                                        user.setPoin = 1000;
                                      });
                                      orderViewModel.togglepoinDiscount(light);
                                      orderViewModel
                                          .refreshTotalPrice(widget.coupon);
                                    }
                                  });
                                },
                              ),
                            ),
                            Text(
                              "- Rp ${orderViewModel.poinDiscount}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.coupon != null ? "Potongan Kupon" : "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.coupon != null
                              ? "- Rp ${context.read<OrderViewModel>().discountCoupon}"
                              : "",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green),
                        ),
                      ],
                    )),
                Container(
                    // height: 100,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BottomPayment(
                                  icon: Icon(
                                    Icons.payments_outlined,
                                    color: Color(0xffCA110F),
                                  ),
                                  name: "Tunai",
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const CouponPage(
                                        category: "food",
                                      );
                                    }));
                                  },
                                  child: const BottomPayment(
                                    icon: Icon(
                                      Icons.discount,
                                      color: Color(0xff299640),
                                    ),
                                    name: "Pakai Kupon",
                                  ),
                                ),
                                const Icon(Icons.more_horiz)
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffCB1112)),
                              onPressed: () async {
                                OverlayLoadingProgress.start(context,
                                    widget: const Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                            Text(
                                              "Pesanan sedang di proses",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                                await orderViewModel.createOrder(
                                    orderViewModel.total,
                                    user,
                                    "food",
                                    "Mie Gacoan");
                                await couponViewModel
                                    .deleteCoupon(widget.coupon);
                                await context
                                    .read<UserViewModel>()
                                    .updateUser(user);
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                OverlayLoadingProgress.stop();
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return PickupJogjaRide(
                                      total: orderViewModel.total,
                                    );
                                  },
                                ));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Pesan Sekarang",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Rp ${orderViewModel.total}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                        )
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
