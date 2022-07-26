import 'package:flutter/material.dart';

class RowDetails extends StatefulWidget {
  final String firstString;
  // ignore: prefer_typing_uninitialized_variables
  final String secondString;
  final VoidCallback onTap;

  const RowDetails({
    Key? key,
    required this.firstString,
    required this.secondString,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RowDetails> createState() => _RowDetailsState();
}

class _RowDetailsState extends State<RowDetails> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.firstString,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.secondString,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}