// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/infra/model/user_model.dart';
import 'package:projeto_1/shared/barber_list_item.dart';

import 'container_filter.dart';
import 'image_container.dart';
import 'topbar_widget.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UsuarioModel usuario = GetIt.I.get<UsuarioModel>();

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      TopBarWidget(userName: usuario.userName!),
      Expanded(
        child: SizedBox(
          width: size.width,
          height: double.maxFinite,
          child: CustomScrollView(
            shrinkWrap: true,
            // shrinkWrap: true,
            slivers: [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                actions: <Widget>[SizedBox()],
                backgroundColor: Colors.black,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: ImageContainer(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return SizedBox(
                      height: size.height - 160,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Row(
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
                          ),
                          const SizedBox(height: 7),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Expanded(
                                  child:
                                      ContainerFilterIcon(filterName: 'Preço'),
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
                          ),
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: Expanded(
                              child: RefreshIndicator(
                                displacement: 25,
                                strokeWidth: 3,
                                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                                backgroundColor:
                                    const Color.fromARGB(255, 34, 34, 34),
                                color: Colors.white,
                                onRefresh: () => _reloadListItem(),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: ListView(
                                    physics: const BouncingScrollPhysics(),
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, left: 15, bottom: 15),
                                        child: BarberListItem(
                                            imgBarberShop: imgBarberFelipe,
                                            star: 5,
                                            distance: 4.6,
                                            barberShopName: 'Outsider barber',
                                            berbercutPrice: 25,
                                            haircutPrice: 20),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, left: 15, bottom: 15),
                                        child: BarberListItem(
                                            imgBarberShop: imgBarberFelipe,
                                            star: 4,
                                            distance: 10.6,
                                            barberShopName: 'Packers Barbearia',
                                            berbercutPrice: 25,
                                            haircutPrice: 20),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, left: 15, bottom: 15),
                                        child: BarberListItem(
                                            imgBarberShop: imgBarberFelipe,
                                            star: 5,
                                            distance: 0.4,
                                            barberShopName:
                                                'Black dog barbershop',
                                            berbercutPrice: 30,
                                            haircutPrice: 25),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, left: 15, bottom: 15),
                                        child: BarberListItem(
                                            imgBarberShop: imgBarberFelipe,
                                            star: 4,
                                            distance: 2.6,
                                            barberShopName:
                                                'El Chape Barbearia',
                                            berbercutPrice: 25,
                                            haircutPrice: 20),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, left: 15, bottom: 15),
                                        child: BarberListItem(
                                            imgBarberShop: imgBarberFelipe,
                                            star: 3,
                                            distance: 2.50,
                                            barberShopName: 'Royal Barbershop',
                                            berbercutPrice: 25,
                                            haircutPrice: 20),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, left: 15, bottom: 15),
                                        child: BarberListItem(
                                            imgBarberShop: imgBarberFelipe,
                                            star: 3,
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
        ),
      ),
    ]);
  }

  Future<void> _reloadListItem() async {
    Future.delayed(const Duration(milliseconds: 1500), () {});
  }
}
