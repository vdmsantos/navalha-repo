import 'package:flutter/material.dart';

import '../../core/assets.dart';
import '../calendar/calendar_page.dart';
import '../../shared/topcontainer_stars_pattern.dart';

import '../../shared/row_details.dart';
import '../../shared/scaffold_pattern.dart';
import 'widgets/container_button_details.dart';
import 'widgets/container_button_schedule.dart';
import 'widgets/container_button_services.dart';
import 'widgets/container_details_barbershop.dart';
import 'widgets/container_list_services.dart';
import 'widgets/container_profissionals.dart';
import 'widgets/list_profissionals.dart';
import 'widgets/list_services.dart';

class BarberShopPage extends StatefulWidget {
  const BarberShopPage({super.key});

  @override
  State<BarberShopPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BarberShopPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    setBottomBarIndex(index) {
      setState(() {
        currentIndex = index;
      });
    }

    Size size = MediaQuery.of(context).size;
    return ScaffoldPattern(
      bodyPage: SizedBox(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: TopContainerPatternStar(
                  star: 2,
                  title: 'The gentleman',
                  profile: barberPhoto,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return SizedBox(
                    height: 520,
                    width: 50,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setBottomBarIndex(0);
                                  },
                                  child: ContainerButtonDetails(
                                      currentIndex: currentIndex),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setBottomBarIndex(1);
                                  },
                                  child: ContainerButtonServices(
                                      currentIndex: currentIndex),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setBottomBarIndex(2);
                                  },
                                  child: ContainerButoonSchedule(
                                      currentIndex: currentIndex),
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                        if (currentIndex == 0)
                          const ContainerDetailsBarberShop(
                            andress:
                                'Rua Antônio da veiga, 416 - Victor Konder - Blumenau- SC',
                            hoursOpen: 'Das 08:00 até 21:00',
                            phone: '(47) 9 9999-9999',
                          ),
                        if (currentIndex == 1) const ListServices(),
                        if (currentIndex == 2) const ListProfessionals(),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
