import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtonNextRegister extends HookConsumerWidget {
  final MaterialButton button;

  const ButtonNextRegister({
    Key? key,
    required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 50, bottom: 30),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(36, 36, 36, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [button],
                ),
              ),
            ),
            const Positioned(
              right: -30,
              child: CircleAvatar(
                radius: 29,
                backgroundColor: Color.fromRGBO(36, 36, 36, 1),
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
