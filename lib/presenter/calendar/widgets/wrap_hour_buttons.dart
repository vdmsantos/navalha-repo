import 'package:flutter/material.dart';

import 'hour_buttons.dart';

String? hourSelected = '';

class WrapHourButtons extends StatefulWidget {
  const WrapHourButtons({Key? key}) : super(key: key);

  @override
  State<WrapHourButtons> createState() => _WrapHourButtonsState();
}

class _WrapHourButtonsState extends State<WrapHourButtons> {
  int indexSelected = 0;
  changeIndexSelected(int index) {
    indexSelected = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        HoursButtons(
          text: '08:00',
          index: 1,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '08:00';

            changeIndexSelected(1);
          },
        ),
        HoursButtons(
          text: '08:30',
          index: 2,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '08:30';

            changeIndexSelected(2);
          },
        ),
        HoursButtons(
          text: '09:00',
          index: 3,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '09:00';

            changeIndexSelected(3);
          },
        ),
        HoursButtons(
          text: '09:30',
          index: 4,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '09:30';
            changeIndexSelected(4);
          },
        ),
        HoursButtons(
          text: '10:00',
          index: 5,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '10:00';
            changeIndexSelected(5);
          },
        ),
        HoursButtons(
          text: '10:30',
          index: 6,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '10:30';
            changeIndexSelected(6);
          },
        ),
        HoursButtons(
          text: '11:00',
          index: 7,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '11:00';
            changeIndexSelected(7);
          },
        ),
        HoursButtons(
          text: '11:30',
          index: 8,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '11:30';
            changeIndexSelected(8);
          },
        ),
        HoursButtons(
          text: '12:00',
          index: 9,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '12:00';
            changeIndexSelected(9);
          },
        ),
        HoursButtons(
          text: '12:30',
          index: 10,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '12:30';
            changeIndexSelected(10);
          },
        ),
        HoursButtons(
          text: '13:00',
          index: 11,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '13:00';
            changeIndexSelected(11);
          },
        ),
        HoursButtons(
          text: '13:30',
          index: 12,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '13:30';
            changeIndexSelected(12);
          },
        ),
        HoursButtons(
          text: '14:00',
          index: 13,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '14:00';
            changeIndexSelected(13);
          },
        ),
        HoursButtons(
          text: '14:30',
          index: 14,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '14:30';
            changeIndexSelected(14);
          },
        ),
        HoursButtons(
          text: '15:00',
          index: 15,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '15:00';
            changeIndexSelected(15);
          },
        ),
        HoursButtons(
          text: '15:30',
          index: 16,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '15:30';
            changeIndexSelected(16);
          },
        ),
        HoursButtons(
          text: '16:00',
          index: 17,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '16:00';
            changeIndexSelected(17);
          },
        ),
        HoursButtons(
          text: '16:30',
          index: 18,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '16:30';
            changeIndexSelected(18);
          },
        ),
        HoursButtons(
          text: '17:00',
          index: 19,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '17:00';
            changeIndexSelected(19);
          },
        ),
        HoursButtons(
          text: '17:30',
          index: 20,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '17:30';
            changeIndexSelected(20);
          },
        ),
        HoursButtons(
          text: '18:00',
          index: 21,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '18:00';
            changeIndexSelected(21);
          },
        ),
        HoursButtons(
          text: '18:30',
          index: 22,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '18:30';
            changeIndexSelected(22);
          },
        ),
        HoursButtons(
          text: '19:00',
          index: 23,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '19:00';

            changeIndexSelected(23);
          },
        ),
        HoursButtons(
          text: '19:30',
          index: 24,
          indexSelected: indexSelected,
          onPressed: () {
            hourSelected = '19:30';

            changeIndexSelected(24);
          },
        ),
      ],
    );
  }
}
