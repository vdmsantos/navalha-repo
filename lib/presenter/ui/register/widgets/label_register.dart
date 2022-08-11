import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

class LabelRegister extends HookConsumerWidget {
  String text;

  LabelRegister({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return SizedBox(
      width: 350,
      child: Text(
        text,
        style: TextStyle(
          color:
              darkMode.darkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}