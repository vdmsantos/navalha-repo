import 'package:flutter/material.dart';

class ServicesButtons extends StatefulWidget {
  const ServicesButtons({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ServicesButtons> createState() => _ServicesButtonsState();

  final String text;
}

class _ServicesButtonsState extends State<ServicesButtons> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // key: UniqueKey(),
      color: isFavorite ? Colors.black : const Color.fromARGB(255, 66, 66, 66),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Text(
        widget.text,
        style: TextStyle(
          color: isFavorite ? Colors.grey : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}