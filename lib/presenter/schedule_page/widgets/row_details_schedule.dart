// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class RowDetailsSchedule extends StatefulWidget {
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
  State<RowDetailsSchedule> createState() => _RowDetailsState();
}

class _RowDetailsState extends State<RowDetailsSchedule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              '${widget.dateString} às ${widget.hourString}',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
