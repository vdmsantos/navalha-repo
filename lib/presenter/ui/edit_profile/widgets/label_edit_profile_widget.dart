import 'package:flutter/material.dart';

import '../../../controller/dark_mode_controller.dart';

class LabelEditProfile extends StatelessWidget {
  final DarkModeController darkMode;
  final String text;

  const LabelEditProfile({
    Key? key,
    required this.darkMode,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Text(
        "$text:",
        style: TextStyle(
          color: darkMode.darkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
