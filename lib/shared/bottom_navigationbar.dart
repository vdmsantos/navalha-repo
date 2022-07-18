import 'package:flutter/material.dart';

class BottomNavigationBarber extends StatelessWidget {
  const BottomNavigationBarber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          backgroundColor: Color.fromARGB(255, 36, 36, 36),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 30),
          label: 'Ajustes',
          backgroundColor: Color.fromARGB(255, 36, 36, 36),
        ),
        BottomNavigationBarItem(
          icon: Text(
            'NAVALHA',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          label: '',
          backgroundColor: Color.fromARGB(255, 36, 36, 36),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_sharp, size: 30),
          label: 'Agenda',
          backgroundColor: Color.fromARGB(255, 36, 36, 36),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: 'Início',
          backgroundColor: Color.fromARGB(255, 36, 36, 36),
        ),
      ],
      // currentIndex: _selectedIndex,
      // //selectedItemColor: Colors.white,
      // onTap: _onItemTapped,
    );
  }
}
