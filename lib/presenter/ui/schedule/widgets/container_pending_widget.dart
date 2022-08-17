import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

class ContainerPending extends HookConsumerWidget {
  final double berbercutPrice;
  final double haircutPrice;
  final String barberShopName;
  final String dayOfService;
  final String hourOfService;
  final Color topColorDark;
  final Color topColorLight;
  final Color bottomCollorDark;
  final Color bottomCollorLight;

  const ContainerPending({
    Key? key,
    required this.berbercutPrice,
    required this.haircutPrice,
    required this.barberShopName,
    this.topColorDark = Colors.black,
    this.topColorLight = Colors.white,
    this.bottomCollorDark = const Color.fromARGB(255, 34, 34, 34),
    this.bottomCollorLight = const Color.fromARGB(255, 34, 34, 34),
    required this.dayOfService,
    required this.hourOfService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    double fillPercent = 32.00;

    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    final List<Color> gradientDark = [
      topColorDark,
      topColorDark,
      bottomCollorDark,
      bottomCollorDark,
    ];

    final List<Color> gradientLight = [
      topColorLight,
      topColorLight,
      bottomCollorLight,
      bottomCollorLight,
    ];

    return Container(
      height: 140,
      padding: const EdgeInsets.only(top: 8, left: 15),
      width: 320,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: darkMode.darkMode ? gradientDark : gradientLight,
          stops: stops,
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(10),
        color: darkMode.darkMode
            ? const Color.fromARGB(255, 24, 24, 24)
            : const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(color: const Color.fromARGB(255, 52, 51, 51)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                barberShopName,
                style: TextStyle(
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Cabelo',
                style: TextStyle(
                  color: darkMode.darkMode ? Colors.white : Colors.black,
                  fontSize: 15,
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
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 140),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'R\$ 37,00',
                    style: TextStyle(
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'R\$',
                style: TextStyle(
                  color: darkMode.darkMode ? Colors.white : Colors.black,
                  fontSize: 12,
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
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                      fontSize: 12,
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
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${berbercutPrice.toInt()},',
                style: TextStyle(
                  color: darkMode.darkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          dayOfService,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Text(
                          hourOfService,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 100),
                        const Text(
                          'Pendente',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
