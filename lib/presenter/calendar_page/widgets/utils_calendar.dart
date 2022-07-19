import 'package:flutter/material.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.day);
final kLastDay = DateTime(2022, 12, 31);

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();

  final String text;
  final VoidCallback onPressed;
}

class _MyButtonState extends State<MyButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isFavorite ? Colors.black : const Color.fromARGB(255, 66, 66, 66),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: () {
        setState(() => isFavorite = !isFavorite);
        widget.onPressed();
      },
      child: Text(
        widget.text,
        style: TextStyle(
            color: isFavorite ? Colors.grey : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13),
      ),
    );
  }
}
