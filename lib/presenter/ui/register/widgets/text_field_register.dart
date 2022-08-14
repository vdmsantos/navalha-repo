// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_1/core/providers.dart';

class TextFieldRegister extends HookConsumerWidget {
  TextEditingController? input;

  TextFieldRegister({
    required this.input,
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
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: TextField(
            controller: input,
            style: TextStyle(
              color: darkMode.darkMode ? Colors.white : Colors.black,
              fontSize: 18,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
