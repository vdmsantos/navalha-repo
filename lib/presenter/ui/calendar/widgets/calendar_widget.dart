import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/providers.dart';

// import '../../../../core/providers.dart';

String daySelected = DateFormat.MEd('pt_BR').format(DateTime.now());

// class CalendarWidget extends StatefulWidget {
//   const CalendarWidget({Key? key}) : super(key: key);

//   @override
//   State<CalendarWidget> createState() => _CalendarWidgetState();
// }

final selectedDayProvider = ChangeNotifierProvider(
  (ref) => SelectedDayController(),
);

class SelectedDayController extends ChangeNotifier {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void setDay() {
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      daySelected = DateFormat.MEd('pt_BR').format(selectedDay);
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    }
    notifyListeners();
  }
}

class CalendarWidget extends HookConsumerWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    final selectedDay = ref.watch(selectedDayProvider);

    selectedDay.setDay();

    return TableCalendar(
      locale: 'pt_BR',
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday) {
            final text = DateFormat.E('en_US').format(day);
            return Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            );
          }
          return null;
        },
      ),

      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: darkMode.darkMode
            ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            : const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        weekendStyle: darkMode.darkMode
            ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            : const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),

      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 01, 01),
      focusedDay: selectedDay._focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay._selectedDay, day),
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,

      calendarStyle: CalendarStyle(
        disabledTextStyle: darkMode.darkMode
            ? const TextStyle(color: Color.fromARGB(255, 75, 74, 72))
            : const TextStyle(color: Color.fromARGB(255, 153, 149, 138)),
        outsideDaysVisible: false,
        isTodayHighlighted: false,
        markersMaxCount: 0,
        defaultTextStyle: darkMode.darkMode
            ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            : const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        weekendTextStyle: darkMode.darkMode
            ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            : const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: darkMode.darkMode
              ? Colors.blueGrey[300]
              : const Color.fromARGB(255, 41, 43, 44),
        ),
      ),

      onDaySelected: selectedDay._onDaySelected,
      onPageChanged: (focusedDay) {
        selectedDay._focusedDay = focusedDay;
      },
      
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: darkMode.darkMode
            ? const TextStyle(color: Colors.white, fontSize: 20)
            : const TextStyle(color: Colors.black, fontSize: 20),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: darkMode.darkMode ? Colors.white : Colors.black,
          size: 30,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: darkMode.darkMode ? Colors.white : Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
