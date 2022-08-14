// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers.dart';
import '../widgets/shared/scaffold_pattern.dart';
import '../widgets/shared/topcontainer_pattern.dart';
import 'widgets/calendar_widget.dart';
import 'widgets/schedule_button_widget.dart';
import 'widgets/wrap_hour_buttons_widget.dart';
import 'widgets/wrap_services_buttons_widget.dart';

class CalendarPage extends HookConsumerWidget {
  final iconBarberSelect;
  final String nameBarberSelect;

  const CalendarPage(
    this.iconBarberSelect, {
    required this.nameBarberSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return ScaffoldPattern(
      bodyPage: SingleChildScrollView(
        child: Column(
          children: [
            TopContainerPattern(
              title: 'Agendar Horário',
              name: nameBarberSelect,
              profile: iconBarberSelect,
            ),
            const CalendarWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Serviços:',
                    style: TextStyle(
                      fontSize: 18,
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            WrapServicesButtons(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Text(
                  'Horários:',
                  style: TextStyle(
                    fontSize: 18,
                    color: darkMode.darkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const WrapHourButtons(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ScheduleButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
