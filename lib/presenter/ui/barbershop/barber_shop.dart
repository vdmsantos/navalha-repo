import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/assets.dart';
import '../../../core/providers.dart';
import '../widgets/shared/scaffold_pattern.dart';
import '../widgets/shared/topcontainer_stars_pattern.dart';
import 'widgets/container_button_barber_shop_widget.dart';
import 'widgets/container_details_barbershop_widget.dart';
import 'widgets/list_profissionals_widget.dart';
import 'widgets/list_services_widget.dart';

class BarberShopPage extends HookConsumerWidget {
  final String barberShopName;

  BarberShopPage({
    required this.barberShopName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    final currentIndex = ref.watch(currentIndexProvider);

    Size size = MediaQuery.of(context).size;
    return ScaffoldPattern(
      bodyPage: SizedBox(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: const <Widget>[SizedBox()],
              backgroundColor: darkMode.darkMode
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : const Color.fromARGB(255, 211, 206, 206),
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                background: TopContainerPatternStar(
                  star: 2,
                  title: barberShopName,
                  profile: imgBarberPhoto,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return SizedBox(
                    height: 600,
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
                                    currentIndex.setBottomBarIndex(0);
                                  },
                                  child: ContainerButtonBarberShop(
                                    currentIndex: currentIndex.currentIndex,
                                    name: 'Detalhes',
                                    index: 0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    currentIndex.setBottomBarIndex(1);
                                  },
                                  child: ContainerButtonBarberShop(
                                    currentIndex: currentIndex.currentIndex,
                                    name: 'Serviços',
                                    index: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    currentIndex.setBottomBarIndex(2);
                                  },
                                  child: ContainerButtonBarberShop(
                                    currentIndex: currentIndex.currentIndex,
                                    name: 'Agendar',
                                    index: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                        if (currentIndex.currentIndex == 0)
                          const ContainerDetailsBarberShop(
                            andress:
                                'Rua Antônio da veiga, 416 - Victor Konder - Blumenau- SC',
                            hoursOpen: 'Das 08:00 até 21:00',
                            phone: '(47) 9 9999-9999',
                          ),
                        if (currentIndex.currentIndex == 1)
                          const ListServices(),
                        if (currentIndex.currentIndex == 2)
                          const ListProfessionals(),
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
