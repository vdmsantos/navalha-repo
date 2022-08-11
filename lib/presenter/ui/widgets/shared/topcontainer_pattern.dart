import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/assets.dart';
import '../../../../core/providers.dart';
import '../../barbershop/barber_shop.dart';

// class TopContainerPattern extends StatefulWidget {
//   final String title;
//   final String name;
//   final String profile;

//   const TopContainerPattern({
//     Key? key,
//     required this.title,
//     required this.name,
//     required this.profile,
//   }) : super(key: key);

//   @override
//   State<TopContainerPattern> createState() => _TopContainerPatternState();
// }

class TopContainerPattern extends HookConsumerWidget {
  final String title;
  final String name;
  final String profile;

  TopContainerPattern({
    required this.title,
    required this.name,
    required this.profile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 80,
                  image: AssetImage(imgFundoCadeira),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        size: 30,
                        Icons.arrow_back_ios_new,
                        color: darkMode.darkMode ? Colors.white : Colors.black,
                        shadows: [
                          Shadow(
                            offset: const Offset(1, 1),
                            blurRadius: 2,
                            color: darkMode.darkMode
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : Colors.white,
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BarberShopPage(
                              barberShopName: 'BarberShopName',
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color:
                              darkMode.darkMode ? Colors.white : Colors.black,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 1,
                              color: darkMode.darkMode
                                  ? const Color.fromARGB(255, 0, 0, 0)
                                  : Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 80),
              width: double.maxFinite,
              height: 60,
              decoration: BoxDecoration(
                color: darkMode.darkMode
                    ? const Color.fromARGB(255, 42, 42, 42)
                    : const Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(35),
                ),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    shadows: [
                      Shadow(
                        blurRadius: 1,
                        color: darkMode.darkMode ? Colors.black : const Color.fromARGB(255, 74, 72, 72),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 112,
          child: CircleAvatar(
            backgroundColor: darkMode.darkMode
                ? Colors.white
                : const Color.fromARGB(255, 42, 42, 42),
            radius: 77,
            child: CircleAvatar(
              radius: 75,
              backgroundColor: darkMode.darkMode
                  ? const Color.fromARGB(255, 42, 42, 42)
                  : Colors.white,
              child: SizedBox(
                child: Image(
                  image: AssetImage(
                    profile,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
