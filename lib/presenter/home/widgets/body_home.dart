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
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFFFFFFF))),
        ),
        padding: const EdgeInsets.only(top: 22, left: 25, right: 15),
        child: Container(
          padding: const EdgeInsets.all(13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bom dia,',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
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
                child: Icon(
                  size: 45,
                  Icons.menu_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      BarberListItem(),
    ]);
  }
}
