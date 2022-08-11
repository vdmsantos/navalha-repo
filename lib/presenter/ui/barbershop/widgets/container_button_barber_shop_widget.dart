import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';


class ContainerButtonBarberShop extends HookConsumerWidget {
  final int currentIndex;
  final int index;
  final String name;

  const ContainerButtonBarberShop({
    Key? key,
    required this.currentIndex,
    required this.index,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Container(
      decoration: BoxDecoration(
        color: darkMode.darkMode ? ((currentIndex == index)
            ? const Color.fromARGB(255, 0, 0, 0)
            : const Color.fromARGB(255, 34, 34, 34)) : ((currentIndex == index)
            ? const Color.fromARGB(255, 34, 34, 34)
            : const Color.fromARGB(255, 255, 255, 255)),
        boxShadow: [
          BoxShadow(
            color: darkMode.darkMode ? ((currentIndex == index)
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(0, 94, 94, 94)) : ((currentIndex == index)
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 41, 40, 40)),
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      height: 35,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 7,
            ),
            Text(
              name,
              style: TextStyle(
                  color: darkMode.darkMode ? ((currentIndex == index)
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 255, 255, 255)) : ((currentIndex == index)
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 0, 0, 0)),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
