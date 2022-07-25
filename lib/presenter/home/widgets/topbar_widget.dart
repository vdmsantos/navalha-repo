import 'package:flutter/material.dart';

import '../../../core/assets.dart';
import '../../../shared/scaffold_pattern.dart';

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
      decoration: const BoxDecoration(),
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
              Text(
                  userName.contains(' ')
                      ? userName.substring(0, userName.indexOf(' '))
                      : userName,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DrawerWidget(
                            name: 'Vitor',
                            photoProfile: imgBarberPhoto,
                          )));
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
