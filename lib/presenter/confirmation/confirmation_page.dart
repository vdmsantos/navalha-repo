import 'package:flutter/material.dart';

import '../../shared/scaffold_pattern.dart';
import 'confirmation_page_body.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({
    Key? key,
    required this.selectDay,
    required this.selectHour,
  }) : super(key: key);

  final String selectDay;
  final String selectHour;

  @override
  State<ConfirmationPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
        bodyPage: BodyConfirmation(
      selectedDay: widget.selectDay,
      selectedHour: widget.selectHour,
    ));
  }
}
