import 'package:flutter/material.dart';

import '../../barbershop_page/barber_shop.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 8),
      decoration: const BoxDecoration(
        // color: Colors.black,
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFFFFFFF))),
      ),
      // padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Boa tarde,',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(userName,
                  style: const TextStyle(
                      shadows: [
                        BoxShadow(
                            color: Color.fromARGB(255, 245, 236, 236),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(1, -1))
                      ],
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Page1()),
              );
            },
            child: Icon(
              size: 35,
              Icons.menu_open_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
