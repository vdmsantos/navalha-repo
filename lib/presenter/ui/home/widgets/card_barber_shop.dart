import 'package:flutter/material.dart';

import '../../widgets/shared/barber_list_item.dart';

class CardBarberShop extends StatelessWidget {
  String barberShopName;
  int star;
  double distance;
  double barbercutPrice;
  double haircutPrice;
  String imgBarberShop;

  CardBarberShop({
    Key? key,
    required this.barberShopName,
    required this.star,
    required this.distance,
    required this.barbercutPrice,
    required this.haircutPrice,
    required this.imgBarberShop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: BarberListItem(
        imgBarberShop: imgBarberShop,
        star: star,
        distance: distance,
        barberShopName: barberShopName,
        barbercutPrice: barbercutPrice,
        haircutPrice: haircutPrice,
      ),
    );
  }
}
