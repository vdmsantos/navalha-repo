import 'package:flutter/material.dart';

import '../../calendar/calendar_page.dart';

class ContainerProfissionals extends StatelessWidget {
  final String barberName;
  final String photoProfile;

  const ContainerProfissionals({
    Key? key,
    required this.barberName,
    required this.photoProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => CalendarPage(
                  iconBarberSelect: photoProfile,
                  nameBarberSelect: barberName,
                )),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, right: 18, bottom: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 44, 44, 44),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(77),
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(77),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      barberName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: const Color.fromARGB(255, 68, 68, 68),
                child: Image.asset(
                  photoProfile,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
