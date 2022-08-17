import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/assets.dart';
import '../../../../core/providers.dart';
import '../../widgets/shared/scaffold_pattern.dart';

class TopBarWidget extends HookConsumerWidget {
  const TopBarWidget({
    Key? key,
    required this.userName,
  }) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

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
              Text('Boa tarde,',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: darkMode.darkMode
                        ? Colors.grey
                        : const Color.fromARGB(255, 71, 71, 71),
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                userName.contains(' ')
                    ? userName.substring(0, userName.indexOf(' '))
                    : userName,
                style: TextStyle(
                    shadows: [
                      BoxShadow(
                        color: darkMode.darkMode
                            ? const Color.fromARGB(255, 245, 236, 236)
                            : const Color.fromARGB(255, 24, 24, 24),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(1, 1),
                      )
                    ],
                    fontSize: 25,
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w400),
              ),
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
                  ),
                ),
              );
            },
            child: Icon(
              size: 35,
              Icons.menu_open_outlined,
              color: darkMode.darkMode ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
