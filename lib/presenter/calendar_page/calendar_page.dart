import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/presenter/confirmation_page/confirmation_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../shared/scaffold_pattern.dart';
import '../../shared/topcontainer_pattern.dart';
import 'widgets/utils_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      bodyPage: SingleChildScrollView(
        child: Column(
          children: [
            const TopContainerPattern(
                title: 'Agendar Horário',
                name: 'Barbeiro',
                profile: barberPhoto),
            TableCalendar(
              locale: 'pt_BR',
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (day.weekday == DateTime.sunday) {
                    final text = DateFormat.E('pt_BR').format(day);
                    return Center(
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return null;
                },
              ),
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: CalendarFormat.week,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                isTodayHighlighted: false,
                markersMaxCount: 0,
                defaultTextStyle: const TextStyle(color: Colors.white),
                weekendTextStyle: const TextStyle(color: Colors.white),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey[300],
                ),
              ),
              onDaySelected: _onDaySelected,
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 30,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Text(
                  'Serviços:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              children: [
                SizedBox(
                  width: 120,
                  child: MyButton(text: 'Corte Máquina', onPressed: () {}),
                ),
                SizedBox(
                  width: 120,
                  child: MyButton(text: 'Barba', onPressed: () {}),
                ),
                SizedBox(
                  width: 120,
                  child: MyButton(text: '-', onPressed: () {}),
                ),
                SizedBox(
                  width: 120,
                  child: MyButton(text: 'Corte Tesoura', onPressed: () {}),
                ),
                SizedBox(
                  width: 120,
                  child: MyButton(text: 'Hidratação', onPressed: () {}),
                ),
                SizedBox(
                  width: 120,
                  child: MyButton(text: '-', onPressed: () {}),
                ),
              ],
            ),
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
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                MyButton(text: '09:00', onPressed: () {}),
                MyButton(text: '09:30', onPressed: () {}),
                MyButton(text: '10:00', onPressed: () {}),
                MyButton(text: '10:30', onPressed: () {}),
                MyButton(text: '11:00', onPressed: () {}),
                MyButton(text: '11:30', onPressed: () {}),
                MyButton(text: '12:00', onPressed: () {}),
                MyButton(text: '12:30', onPressed: () {}),
                MyButton(text: '13:00', onPressed: () {}),
                MyButton(text: '13:30', onPressed: () {}),
                MyButton(text: '14:00', onPressed: () {}),
                MyButton(text: '14:30', onPressed: () {}),
                MyButton(text: '15:00', onPressed: () {}),
                MyButton(text: '15:30', onPressed: () {}),
                MyButton(text: '16:00', onPressed: () {}),
                MyButton(text: '16:30', onPressed: () {}),
                MyButton(text: '17:00', onPressed: () {}),
                MyButton(text: '17:30', onPressed: () {}),
                MyButton(text: '18:00', onPressed: () {}),
                MyButton(text: '18:30', onPressed: () {}),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: const Color.fromARGB(255, 42, 42, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      // side: const BorderSide(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ConfirmationPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Agendar',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
