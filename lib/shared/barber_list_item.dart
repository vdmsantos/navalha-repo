import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../presenter/barbershop/barber_shop.dart';

class BarberListItem extends StatefulWidget {
  const BarberListItem({
    required this.barberShopName,
    this.star = 5,
    this.topColor = const Color.fromARGB(255, 24, 24, 24),
    this.bottomCollor = const Color.fromARGB(255, 34, 34, 34),
    Key? key,
    required this.berbercutPrice,
    required this.haircutPrice,
    required this.distance,
  }) : super(key: key);

  final double berbercutPrice;
  final double haircutPrice;
  final String barberShopName;
  final Color topColor;
  final Color bottomCollor;
  final int star;
  final double distance;

  @override
  State<BarberListItem> createState() => _BarberListItemState();
}

class _BarberListItemState extends State<BarberListItem> {
  List<Widget> starList = [];

  @override
  initState() {
    super.initState();
    setStarList();
  }

  @override
  Widget build(BuildContext context) {
    double fillPercent = 32.00; //

    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    final List<Color> gradient = [
      widget.topColor,
      widget.topColor,
      widget.bottomCollor,
      widget.bottomCollor,
    ];
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BarberShopPage()));
      },
      child: Container(
        height: 130,
        padding: const EdgeInsets.only(top: 15, right: 10, left: 15),
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              stops: stops,
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 24, 24, 24)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.barberShopName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 11),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 7),
                Text(
                  'Cabelo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Barba',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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
                const Text(
                  'R\$',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '${widget.haircutPrice.toInt()},',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      // textAlign: TextAlign.end,
                      '00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'R\$',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '${widget.berbercutPrice.toInt()},',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      // textAlign: TextAlign.end,
                      '00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
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
                        '${widget.distance} km',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
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

  void setStarList() {
    for (var i = 1; i <= 5; i++) {
      if (i <= widget.star) {
        starList.add(
          const Icon(Icons.star, color: Colors.white, shadows: []),
        );
      } else {
        starList.add(
          DecoratedIcon(
            icon: Icon(Icons.star, color: widget.bottomCollor),
            decoration: const IconDecoration(
                border: IconBorder(color: Colors.white, width: 1)),
          ),
        );
      }
    }
  }
}
