import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/barbershop_page/page_1.dart';
import 'package:projeto_1/shared/barber_list_item.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        padding: EdgeInsets.only(top: 25, left: 40, right: 40, bottom: 15),
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.6, color: Color(0xFFFFFFFF))),
        ),
        // padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Bom dia,',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                SizedBox(
                  height: 5,
                ),
                Text('Vinícius',
                    style: TextStyle(fontSize: 23, color: Colors.white)),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Page1()),
                );
              },
              child: const Icon(
                size: 45,
                Icons.menu_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10, left: 18, right: 18),
        height: 205,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          image: const DecorationImage(
            image: AssetImage("assets/images/container_background.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Icon(Icons.filter_alt_rounded, color: Colors.white, size: 14),
              SizedBox(width: 5),
              Text('Filtros',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      borderRadius: BorderRadius.circular(5)),
                  width: 95,
                  height: 35,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Preço',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.white,
                      )
                    ],
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      borderRadius: BorderRadius.circular(5)),
                  width: 95,
                  height: 35,
                  child: const Center(
                      child: Text(
                    'Avaliação',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      borderRadius: BorderRadius.circular(5)),
                  width: 95,
                  height: 35,
                  child: const Center(
                      child: Text(
                    'Distância',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            )
          ],
        ),
      ),
      Expanded(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
              child: const BarberListItem(
                  star: 2,
                  distance: 25.6,
                  barberShopName: 'Outsider barber',
                  berbercutPrice: 25,
                  haircutPrice: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
              child: const BarberListItem(
                  star: 2,
                  distance: 25.6,
                  barberShopName: 'Outsider barber',
                  berbercutPrice: 25,
                  haircutPrice: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
              child: const BarberListItem(
                  star: 2,
                  distance: 25.6,
                  barberShopName: 'Outsider barber',
                  berbercutPrice: 25,
                  haircutPrice: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
              child: const BarberListItem(
                  star: 2,
                  distance: 25.6,
                  barberShopName: 'Outsider barber',
                  berbercutPrice: 25,
                  haircutPrice: 20),
            ),
          ],
        ),
      ),
    ]);
  }
}
