import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

class ContainerListServices extends HookConsumerWidget {
  final String service;
  final String price;

  const ContainerListServices({
    Key? key,
    required this.service,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkMode.darkMode ? const Color.fromARGB(255, 24, 24, 24) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: darkMode.darkMode ? Border.all(color: Colors.white) : Border.all(color: Colors.black) ,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              service,
              style: TextStyle(
                color: darkMode.darkMode ? Colors.white : Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Text(
                    'R\$',
                    style: TextStyle(
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      price,
                      style: TextStyle(
                        color: darkMode.darkMode ? Colors.white : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
