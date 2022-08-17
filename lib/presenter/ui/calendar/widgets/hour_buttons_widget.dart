// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

bool isFavorite = false;

// class HoursButtons extends StatefulWidget {
//   const HoursButtons({
//     Key? key,
//     required this.index,
//     required this.indexSelected,
//     required this.text,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   State<HoursButtons> createState() => _HoursButtonsState();

//   final int index;
//   final int indexSelected;
//   final String text;
//   final void Function() onPressed;
// }

class HoursButtons extends HookConsumerWidget {
  final String text;
  final int index;
  final int indexSelected;
  final void Function() onPressed;

  const HoursButtons({
    super.key,
    required this.text,
    required this.index,
    required this.indexSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return MaterialButton(
      color: darkMode.darkMode
          ? (indexSelected == index
              ? Colors.black
              : const Color.fromARGB(255, 66, 66, 66))
          : (indexSelected == index
              ? const Color.fromARGB(255, 66, 66, 66)
              : Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: darkMode.darkMode
            ? const BorderSide(color: Colors.black)
            : ((indexSelected == index)
                ? const BorderSide(color: Colors.white)
                : const BorderSide(color: Colors.black)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: darkMode.darkMode
              ? Colors.white
              : ((indexSelected == index) ? Colors.white : Colors.black),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  // @override
  // String toString() {
  //   return 'HoursButtons(index: $index, indexSelected: $indexSelected, text: $text, onPressed: $onPressed)';
  // }
}
