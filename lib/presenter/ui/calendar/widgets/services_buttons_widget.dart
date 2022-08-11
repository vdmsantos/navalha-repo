// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

// class ServicesButtons extends StatefulWidget {
//   const ServicesButtons({
//     Key? key,
//     required this.text,
//   }) : super(key: key);

//   @override
//   State<ServicesButtons> createState() => _ServicesButtonsState();

//   final String text;
// }

// final serviceButtonProvider = ChangeNotifierProvider(
//   (ref) => ServiceButtonController(),
// );

// class ServiceButtonController extends ChangeNotifier {
//   bool isFavorite = false;

//   void alterFavorite() {
//     isFavorite = !isFavorite;
//     notifyListeners();
//   }
// }

class ServicesButtons extends HookConsumerWidget {
  final String text;
  final int index;
  // final List<int> indexSelectedList;
  final void Function() onPressedPush;
  final void Function() onPressedPop;
  
  ServicesButtons({
    required this.text,
    required this.index,
    // required this.indexSelectedList,
    required this.onPressedPush,
    required this.onPressedPop,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    final services = ref.watch(selectedServiceProvider);
    // final serviceButton = ref.watch(serviceButtonProvider);

    return MaterialButton(
      // key: UniqueKey(),
      color: darkMode.darkMode ? (services.indexSelectedList.contains(index)
          ? Colors.black
          : const Color.fromARGB(255, 66, 66, 66)) : (services.indexSelectedList.contains(index)
          ? const Color.fromARGB(255, 66, 66, 66)
          : Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: darkMode.darkMode ? const BorderSide(color: Colors.white) : ((services.indexSelectedList.contains(index)) ? const BorderSide(color: Colors.white) : const BorderSide(color: Colors.black)),
      ),
      onPressed: () {
        if (services.indexSelectedList.contains(index)) {
          onPressedPop();
        } else {
          onPressedPush();
        }
      },
      child: Text(
        text,
        style: TextStyle(
          color: darkMode.darkMode ? Colors.white : ((services.indexSelectedList.contains(index)) ? Colors.white : Colors.black),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
