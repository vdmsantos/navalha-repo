// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../shared/scaffold_pattern.dart';
import '../../shared/topcontainer_pattern.dart';
import 'widgets/calendar_widget.dart';
import 'widgets/schedule_button.dart';
import 'widgets/wrap_hour_buttons.dart';
import 'widgets/wrap_services_buttons.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    Key? key,
    required this.iconBarberSelect,
    required this.nameBarberSelect,
  }) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
  final iconBarberSelect;
  final String nameBarberSelect;
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      bodyPage: SingleChildScrollView(
        child: Column(
          children: [
            TopContainerPattern(
              title: 'Agendar Horário',
              name: widget.nameBarberSelect,
              profile: widget.iconBarberSelect,
            ),
            const CalendarWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Serviços:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const WrapServicesButtons(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Text(
                  'Horários:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const WrapHourButtons(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  ScheduleButton(),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
