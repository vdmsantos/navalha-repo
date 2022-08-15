// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/core/providers.dart';
import 'card_barber_shop.dart';
import 'container_filter.dart';
import 'image_container.dart';
import 'topbar_widget.dart';

class BodyHome extends HookConsumerWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientControler = ref.watch(clientProvider);
    Size size = MediaQuery.of(context).size;
    final darkMode = ref.watch(darkModeProvider);

    // UsuarioModel usuario = GetIt.I.get<UsuarioModel>();

    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        TopBarWidget(userName: clientControler.client!.name),
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
                  backgroundColor: Color.fromARGB(0, 0, 0, 0),
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ImageContainer(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      return SizedBox(
                        height: size.height - 20,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.filter_alt_rounded,
                                      color: darkMode.darkMode
                                          ? Colors.white
                                          : Colors.black,
                                      size: 14),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Filtros',
                                    style: TextStyle(
                                        color: darkMode.darkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 7),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Expanded(
                                      child: ContainerFilterIcon(
                                          filterName: 'Preço')),
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
                                  triggerMode:
                                      RefreshIndicatorTriggerMode.onEdge,
                                  backgroundColor:
                                      const Color.fromARGB(255, 34, 34, 34),
                                  color: Colors.white,
                                  onRefresh: () => _reloadListItem(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: ListView(
                                      physics: const BouncingScrollPhysics(),
                                      children:  [
                                        CardBarberShop(
                                          barberShopName: 'Outside Barber',
                                          star: 5,
                                          distance: 4.6,
                                          barbercutPrice: 16,
                                          haircutPrice: 20,
                                          imgBarberShop: imgBarberFelipe,
                                        ),
                                        CardBarberShop(
                                          barberShopName: 'Packers Barbearia',
                                          star: 4,
                                          distance: 10.6,
                                          barbercutPrice: 25,
                                          haircutPrice: 20,
                                          imgBarberShop: imgBarberFelipe,
                                        ),
                                        CardBarberShop(
                                          barberShopName:
                                              'Black dog barbershop',
                                          star: 3,
                                          distance: 16.6,
                                          barbercutPrice: 30,
                                          haircutPrice: 25,
                                          imgBarberShop: imgBarberFelipe,
                                        ),
                                        CardBarberShop(
                                          barberShopName: 'El Chape Barbearia',
                                          star: 2,
                                          distance: 24.6,
                                          barbercutPrice: 35,
                                          haircutPrice: 30,
                                          imgBarberShop: imgBarberFelipe,
                                        ),
                                        CardBarberShop(
                                          barberShopName: 'Royal Barbershop',
                                          star: 1,
                                          distance: 30.6,
                                          barbercutPrice: 40,
                                          haircutPrice: 35,
                                          imgBarberShop: imgBarberFelipe,
                                        ),
                                        CardBarberShop(
                                          barberShopName: 'Outsider barber',
                                          star: 5,
                                          distance: 35.6,
                                          barbercutPrice: 43,
                                          haircutPrice: 38,
                                          imgBarberShop: imgBarberFelipe,
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
      ]),
    );
  }

  Future<void> _reloadListItem() async {
    Future.delayed(const Duration(milliseconds: 1500), () {});
  }
}
