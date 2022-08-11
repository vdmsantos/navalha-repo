import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

String daySelected = DateFormat.MEd('pt_BR').format(DateTime.now());

class SelectedDayController extends ChangeNotifier {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  void setDay() {
    selectedDay = focusedDay;
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(selectedDay, selectedDay)) {
      daySelected = DateFormat.MEd('pt_BR').format(selectedDay);
      selectedDay = selectedDay;
      focusedDay = focusedDay;
    }
    notifyListeners();
  }
}
