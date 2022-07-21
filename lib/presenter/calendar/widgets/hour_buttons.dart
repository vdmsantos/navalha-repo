import 'package:flutter/material.dart';

bool isFavorite = false;

class HoursButtons extends StatefulWidget {
  const HoursButtons({
    Key? key,
    required this.index,
    required this.indexSelected,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<HoursButtons> createState() => _HoursButtonsState();

  final int index;
  final int indexSelected;
  final String text;
  final void Function() onPressed;
}

class _HoursButtonsState extends State<HoursButtons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: widget.indexSelected == widget.index
          ? Colors.black
          : const Color.fromARGB(255, 66, 66, 66),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: widget.onPressed,
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