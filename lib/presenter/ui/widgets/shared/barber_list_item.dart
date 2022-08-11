import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../../../../core/providers.dart';
import '../../barbershop/barber_shop.dart';
import 'scaffold_pattern.dart';

// class BarberListItem extends StatefulWidget {
//   final double barbercutPrice;
//   final double haircutPrice;
//   final String barberShopName;
//   final Color topColor;
//   final Color bottomCollor;
//   final int star;
//   final double distance;
//   final String imgBarberShop;

//   const BarberListItem({
//     Key? key,
//     required this.barbercutPrice,
//     required this.haircutPrice,
//     required this.barberShopName,
//     this.topColor = const Color.fromARGB(255, 24, 24, 24),
//     this.bottomCollor = const Color.fromARGB(255, 34, 34, 34),
//     this.star = 5,
//     required this.distance,
//     required this.imgBarberShop,
//   }) : super(key: key);

//   @override
//   State<BarberListItem> createState() => _BarberListItemState();
// }

// final barberListItemProvider = ChangeNotifierProvider(
//   (ref) => BarberListItemProviderController(),
// );

// class BarberListItemProviderController extends ChangeNotifier {
//   List<Widget> starList = [];

//   void setStarList(int star, Color bottomCollor, Color filledStar) {
//     starList.clear();
//     for (var i = 1; i <= 5; i++) {
//       if (i <= star) {
//         starList.add(
//           Icon(Icons.star, color: filledStar),
//         );
//       } else {
//         starList.add(
//           DecoratedIcon(
//             icon: Icon(Icons.star, color: bottomCollor),
//           ),
//         );
//       }
//     }
//     notifyListeners();
//   }
// }

class BarberListItem extends HookConsumerWidget {
  final double barbercutPrice;
  final double haircutPrice;
  final String barberShopName;
  Color topColor = const Color.fromARGB(255, 24, 24, 24);
  final Color bottomCollor = const Color.fromARGB(255, 34, 34, 34);
  final int star;
  final double distance;
  final String imgBarberShop;

  BarberListItem({
    Key? key,
    required this.barbercutPrice,
    required this.haircutPrice,
    required this.barberShopName,
    required this.star,
    required this.distance,
    required this.imgBarberShop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    // final barberListItem = ref.watch(barberListItemProvider);
    List<Widget> starList = [];
    Color noStar;
    Color filledStar;

    darkMode.darkMode
        ? noStar = const Color.fromARGB(255, 98, 93, 93)
        : noStar = const Color.fromARGB(255, 98, 93, 93);

    darkMode.darkMode
        ? filledStar = const Color.fromARGB(255, 255, 255, 255)
        : filledStar = const Color.fromARGB(255, 255, 255, 255);

    starList.clear();
    for (var i = 1; i <= 5; i++) {
      if (i <= star) {
        starList.add(
          Icon(Icons.star, color: filledStar),
        );
      } else {
        starList.add(
          DecoratedIcon(
            icon: Icon(Icons.star, color: noStar),
          ),
        );
      }
    }

    topColor = darkMode.darkMode
        ? const Color.fromARGB(255, 24, 24, 24)
        : const Color.fromARGB(255, 255, 255, 255);

    double fillPercent = 32.00; //

    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    final List<Color> gradient = [
      topColor,
      topColor,
      bottomCollor,
      bottomCollor,
    ];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BarberShopPage(
              barberShopName: barberShopName,
            ),
          ),
        );
      },
      child: Container(
        height: 130,
        padding: const EdgeInsets.only(top: 15, right: 10, left: 15),
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: darkMode.darkMode
              ? Border.all(color: Colors.white)
              : Border.all(color: Colors.black),
          gradient: LinearGradient(
            colors: gradient,
            stops: stops,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  barberShopName,
                  style: TextStyle(
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 11),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 7),
                Text(
                  'Cabelo',
                  style: TextStyle(
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  'Barba',
                  style: TextStyle(
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$',
                  style: TextStyle(
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '${haircutPrice.toInt()},',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // textAlign: TextAlign.end,
                      '00',
                      style: TextStyle(
                        color: darkMode.darkMode ? Colors.white : Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'R\$',
                  style: TextStyle(
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '${barbercutPrice.toInt()},',
                  style: TextStyle(
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // textAlign: TextAlign.end,
                      '00',
                      style: TextStyle(
                        color: darkMode.darkMode ? Colors.white : Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Row(children: [
                      const Icon(Icons.location_on_outlined,
                          color: Colors.white),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$distance km',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])
                  ]),
                  const SizedBox(
                    width: 95,
                  ),
                  Column(children: [
                    Row(children: [for (int i = 0; i <= 4; i++) starList[i]])
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // void setStarList() {
  //   for (var i = 1; i <= 5; i++) {
  //     if (i <= star) {
  //       starList.add(
  //         const Icon(Icons.star, color: Colors.white, shadows: []),
  //       );
  //     } else {
  //       starList.add(
  //         DecoratedIcon(
  //           icon: Icon(Icons.star, color: bottomCollor),
  //           decoration: const IconDecoration(
  //             border: IconBorder(color: Colors.white, width: 1),
  //           ),
  //         ),
  //       );
  //     }
  //   }
  // }
}
