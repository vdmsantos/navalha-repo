import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/barbershop_page/barber_shop.dart';
import 'package:projeto_1/shared/barber_list_item.dart';

import 'container_filter.dart';
import 'image_container.dart';
import 'topbar_widget.dart';

class BodyHome1 extends StatelessWidget {
  const BodyHome1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const TopBarWidget(userName: 'Viníciusw'),
      Container(
        width: size.width,
        height: size.height - 150,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: const ImageContainer(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Container(
                    height: 520,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(Icons.filter_alt_rounded,
                                    color: Colors.white, size: 14),
                                SizedBox(width: 5),
                                Text('Filtros',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ]),
                          const SizedBox(height: 7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(
                                child: ContainerFilterIcon(filterName: 'Preço'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: ContainerFilterIcon(
                                    filterName: 'Avaliação'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: ContainerFilterIcon(
                                    filterName: 'Distância'),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: RefreshIndicator(
                                displacement: 25,
                                strokeWidth: 3,
                                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                                backgroundColor:
                                    const Color.fromARGB(255, 34, 34, 34),
                                color: Colors.white,
                                onRefresh: () => _reloadListItem(),
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 15, left: 15, bottom: 15),
                                      child: BarberListItem(
                                          star: 2,
                                          distance: 25.6,
                                          barberShopName: 'Outsider barber',
                                          berbercutPrice: 25,
                                          haircutPrice: 20),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 15, left: 15, bottom: 15),
                                      child: BarberListItem(
                                          star: 2,
                                          distance: 25.6,
                                          barberShopName: 'Packers Barbearia',
                                          berbercutPrice: 25,
                                          haircutPrice: 20),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 15, left: 15, bottom: 15),
                                      child: BarberListItem(
                                          star: 2,
                                          distance: 25.6,
                                          barberShopName: 'Outsider barber',
                                          berbercutPrice: 25,
                                          haircutPrice: 20),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 15, left: 15, bottom: 15),
                                      child: BarberListItem(
                                          star: 7,
                                          distance: 25.6,
                                          barberShopName: 'Outsider barber',
                                          berbercutPrice: 25,
                                          haircutPrice: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      // const ImageContainer(),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 18),
      //   child: Column(
      //     children: [
      //       Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
      //         Icon(Icons.filter_alt_rounded, color: Colors.white, size: 14),
      //         SizedBox(width: 5),
      //         Text('Filtros',
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold)),
      //       ]),
      //       const SizedBox(height: 7),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: const [
      //           Expanded(
      //             child: ContainerFilterIcon(filterName: 'Preço'),
      //           ),
      //           SizedBox(
      //             width: 15,
      //           ),
      //           Expanded(
      //             child: ContainerFilterIcon(filterName: 'Avaliação'),
      //           ),
      //           SizedBox(
      //             width: 15,
      //           ),
      //           Expanded(
      //             child: ContainerFilterIcon(filterName: 'Distância'),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
      // Expanded(
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 12),
      //     child: RefreshIndicator(
      //       displacement: 25,
      //       strokeWidth: 3,
      //       triggerMode: RefreshIndicatorTriggerMode.onEdge,
      //       backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      //       color: Colors.white,
      //       onRefresh: () => _reloadListItem(),
      //       child: ListView(
      //         physics: const BouncingScrollPhysics(),
      //         children: const [
      //           Padding(
      //             padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
      //             child: BarberListItem(
      //                 star: 2,
      //                 distance: 25.6,
      //                 barberShopName: 'Outsider barber',
      //                 berbercutPrice: 25,
      //                 haircutPrice: 20),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
      //             child: BarberListItem(
      //                 star: 2,
      //                 distance: 25.6,
      //                 barberShopName: 'Packers Barbearia',
      //                 berbercutPrice: 25,
      //                 haircutPrice: 20),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
      //             child: BarberListItem(
      //                 star: 2,
      //                 distance: 25.6,
      //                 barberShopName: 'Outsider barber',
      //                 berbercutPrice: 25,
      //                 haircutPrice: 20),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
      //             child: BarberListItem(
      //                 star: 7,
      //                 distance: 25.6,
      //                 barberShopName: 'Outsider barber',
      //                 berbercutPrice: 25,
      //                 haircutPrice: 20),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    ]);
  }

  Future<void> _reloadListItem() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      print('implementar o carregando da lista');
    });
  }
}
