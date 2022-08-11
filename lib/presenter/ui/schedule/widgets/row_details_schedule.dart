// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

class RowDetailsSchedule extends HookConsumerWidget {
  final String firstString;

  final dateString;

  final hourString;

  const RowDetailsSchedule({
    Key? key,
    required this.firstString,
    required this.dateString,
    required this.hourString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              firstString,
              style: TextStyle(
                  color: darkMode.darkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '$dateString às $hourString',
              style: TextStyle(
                color: darkMode.darkMode ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
