import 'package:flutter/material.dart';

class ContainerButtonServices extends StatelessWidget {
  const ContainerButtonServices({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: (currentIndex == 1)
              ? const Color.fromARGB(255, 0, 0, 0)
              : const Color.fromARGB(255, 34, 34, 34),
          boxShadow: [
            BoxShadow(
              color: (currentIndex == 1)
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(0, 94, 94, 94),
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(5)),
      height: 35,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 7,
            ),
            Text(
              'Serviços',
              style: TextStyle(
                  color: (currentIndex == 1)
                      ? const Color.fromARGB(255, 189, 189, 189)
                      : const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
