import 'package:flutter/material.dart';

class RecomendationResto extends StatelessWidget {
  const RecomendationResto({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const Text("Lihat Semua",
                  style: TextStyle(fontSize: 14, color: Colors.red))
            ],
          ),
        ),
        Container(
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
                      blurRadius: 1,
                      offset: Offset(0, 0.5), // Shadow position
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
                          image: AssetImage('assets/recomendation.png')),
                    ),
                    const Expanded(
                      child: Text(
                        "Ayam Bakar P Widodo Galih, Wahid Hasyim, C",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
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
        ),
      ],
    );
  }
}
