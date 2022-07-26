import 'package:flutter/material.dart';

import '../core/assets.dart';
import '../presenter/barbershop/barber_shop.dart';

class TopContainerPattern extends StatefulWidget {
  final String title;
  final String name;
  final String profile;

  const TopContainerPattern({
    Key? key,
    required this.title,
    required this.name,
    required this.profile,
  }) : super(key: key);

  @override
  State<TopContainerPattern> createState() => _TopContainerPatternState();
}

class _TopContainerPatternState extends State<TopContainerPattern> {
  @override
  Widget build(BuildContext context) {
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
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(3, 5),
                            blurRadius: 2,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BarberShopPage()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(3, 5),
                              blurRadius: 2,
                              color: Color.fromARGB(255, 0, 0, 0),
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
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 42, 42, 42),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Center(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Color.fromARGB(255, 0, 0, 0),
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
            backgroundColor: const Color.fromARGB(255, 42, 42, 42),
            radius: 75,
            child: SizedBox(
              child: Image(
                image: AssetImage(
                  widget.profile,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
