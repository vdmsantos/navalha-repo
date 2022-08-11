import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

class TextFieldEditProfile extends HookConsumerWidget {
  final TextEditingController nameController;

  const TextFieldEditProfile({
    super.key,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
          color: darkMode.darkMode
              ? const Color.fromRGBO(36, 36, 36, 1)
              : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          border: darkMode.darkMode
              ? Border.all(color: Colors.white) : Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: TextField(
            controller: nameController,
            style: TextStyle(
                color: darkMode.darkMode
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 60, 58, 58),
                fontSize: 18),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}