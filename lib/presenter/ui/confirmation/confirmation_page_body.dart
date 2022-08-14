// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/assets.dart';
import '../../../core/providers.dart';
import '../home/home_page.dart';
import '../schedule/widgets/row_details_schedule.dart';
import '../widgets/shared/alert_dialog.dart';
import '../widgets/shared/row_details.dart';
import '../widgets/shared/topcontainer_stars_pattern.dart';

class BodyConfirmation extends HookConsumerWidget {
  const BodyConfirmation({
    Key? key,
    required this.selectedDay,
    required this.selectedHour,
  }) : super(key: key);

  final selectedDay;
  final selectedHour;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    Size size = MediaQuery.of(context).size;
    AlertDialogBarber dialog = AlertDialogBarber(
        page: const HomePage(),
        iconColor: Colors.green,
        buttonColor: Colors.greenAccent,
        icon: Icons.check_circle,
        text: 'Horário agendado com sucesso!',
        textbutton: 'Ok');

    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: const <Widget>[SizedBox()],
            backgroundColor: darkMode.darkMode
                ? const Color.fromARGB(255, 0, 0, 0)
                : const Color.fromARGB(255, 209, 208, 208),
            expandedHeight: 260.0,
            flexibleSpace: FlexibleSpaceBar(
              background: TopContainerPatternStar(
                  star: 2, title: 'The gentleman', profile: imgBarberPhoto),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return SizedBox(
                  height: 360,
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: darkMode.darkMode
                                  ? Border.all(color: Colors.white)
                                  : Border.all(color: Colors.black),
                              color: darkMode.darkMode
                                  ? const Color.fromARGB(255, 24, 24, 24)
                                  : const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Confirmar agendamento",
                                        style: TextStyle(
                                          color: darkMode.darkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  RowDetails(
                                    firstString: 'Serviços:',
                                    secondString: 'Barba - Corte Máquina',
                                    onTap: () {},
                                  ),
                                  RowDetailsSchedule(
                                    firstString: 'Horário:',
                                    dateString: selectedDay,
                                    hourString: selectedHour,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(48, 48, 48, 1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    "Total:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "R\$ 30,00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            dialog.showCustomDialog(context);
                          },
                          child: Ink(
                            height: 70,
                            width: 180,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  padding: const EdgeInsets.only(
                                    right: 65,
                                    left: 25,
                                    top: 15,
                                    bottom: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 44, 44, 44),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Text(
                                    'Confirmar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 3,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 115,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 99, 99, 99),
                                    radius: 30,
                                    child: SizedBox(
                                      child: Icon(Icons.check_circle,
                                          size: 32, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
