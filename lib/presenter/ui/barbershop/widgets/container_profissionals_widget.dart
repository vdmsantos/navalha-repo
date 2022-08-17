import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';
import '../../calendar/calendar_page.dart';

class ContainerProfissionals extends HookConsumerWidget {
  final String barberName;
  final String photoProfile;

  const ContainerProfissionals({
    Key? key,
    required this.barberName,
    required this.photoProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => CalendarPage(
                  photoProfile,
                  nameBarberSelect: barberName,
                )),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, right: 18, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: darkMode.darkMode
                    ? const Color.fromARGB(255, 24, 24, 24)
                    : Colors.white,
                border:
                    darkMode.darkMode ? null : Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(77),
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(77),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      barberName,
                      style: TextStyle(
                        color: darkMode.darkMode ? Colors.white : Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: const Color.fromARGB(255, 68, 68, 68),
                child: Image.asset(
                  photoProfile,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
