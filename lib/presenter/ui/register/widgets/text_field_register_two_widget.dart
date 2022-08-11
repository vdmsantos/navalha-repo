
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

class TextFieldRegisterTwo extends HookConsumerWidget {
  const TextFieldRegisterTwo({
    super.key,
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
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
          child: TextField(
            style: TextStyle(
              color: darkMode.darkMode ? Colors.white : Colors.black,
              fontSize: 18,
            ),
            maxLength: 14,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
