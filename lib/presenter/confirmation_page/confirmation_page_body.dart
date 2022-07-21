// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

import '../../core/assets.dart';
import '../../shared/alert_dialog.dart';
import '../../shared/row_details.dart';
import '../../shared/topcontainer_stars_pattern.dart';
import '../schedule_page/widgets/row_details_schedule.dart';

class BodyConfirmation extends StatelessWidget {
  const BodyConfirmation({
    Key? key,
    required this.selectedDay,
    required this.selectedHour,
  }) : super(key: key);

  final selectedDay;
  final selectedHour;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AlertDialogBarber dialog = AlertDialogBarber(
        text: 'Horário agendado com sucesso!', textbutton: 'Ok');

    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            expandedHeight: 260.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('Goa', textScaleFactor: 1),
              background: TopContainerPatternStar(
                  star: 2, title: 'The gentleman', profile: barberPhoto),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return SizedBox(
                  height: 500,
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
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 24, 24, 24),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Confirmar agendamento",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                const RowDetails(
                                  firstString: 'Serviços:',
                                  secondString: 'Barba - Corte Máquina',
                                ),
                                RowDetailsSchedule(
                                  firstString: 'Horário:',
                                  dateString: selectedDay,
                                  hourString: selectedHour,
                                ),
                              ],
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
                                    "RS30,00",
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
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 50, bottom: 132),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                width: 135,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(36, 36, 36, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        dialog.showCustomDialog(context);
                                      },
                                      child: const Text(
                                        "Confirmar",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                right: -30,
                                child: CircleAvatar(
                                  radius: 29,
                                  backgroundColor:
                                      Color.fromRGBO(48, 48, 48, 1),
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
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
