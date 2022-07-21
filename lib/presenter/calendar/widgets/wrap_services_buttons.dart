import 'package:flutter/material.dart';

import 'services_buttons.dart';

class WrapServicesButtons extends StatefulWidget {
  const WrapServicesButtons({Key? key}) : super(key: key);

  @override
  State<WrapServicesButtons> createState() => _WrapServicesButtonsState();
}

class _WrapServicesButtonsState extends State<WrapServicesButtons> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: const [
        SizedBox(
          width: 120,
          child: ServicesButtons(
            text: 'Corte Máquina',
          ),
        ),
        SizedBox(
            width: 120,
            child: ServicesButtons(
              text: 'Barba',
            )),
        SizedBox(
            width: 120,
            child: ServicesButtons(
              text: '-',
            )),
        SizedBox(
            width: 120,
            child: ServicesButtons(
              text: 'Corte Tesoura',
            )),
        SizedBox(
            width: 120,
            child: ServicesButtons(
              text: 'Hidratação',
            )),
        SizedBox(
            width: 120,
            child: ServicesButtons(
              text: '-',
            )),
      ],
    );
  }
}
