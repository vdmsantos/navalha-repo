// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/core/providers.dart';
import 'package:projeto_1/infra/model/barbershop_model.dart';
import 'package:projeto_1/presenter/controller/barber_shop_controller.dart';
import 'card_barber_shop.dart';
import 'container_filter.dart';
import 'image_container.dart';
import 'topbar_widget.dart';

class BodyHome extends ConsumerStatefulWidget {
  const BodyHome({Key? key}) : super(key: key);
  @override
  BodyHomeState createState() => BodyHomeState();
}

class BodyHomeState extends ConsumerState<BodyHome> {
  BarberShopController barberRepo = BarberShopController();

  late List<BarbershopModel> barberShopList;
  late bool valueOrder = false;
  late bool noteOrder = false;
  late bool kmOrder = false;
  @override
  void initState() {
    super.initState();
    barberShopList = barberRepo.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    final clientControler = ref.watch(clientProvider);
    Size size = MediaQuery.of(context).size;
    final darkMode = ref.watch(darkModeProvider);

    void distanceOrder() {
      if (!kmOrder) {
        setState(() {
          kmOrder = true;
          barberShopList.sort((BarbershopModel ppl1, BarbershopModel ppl2) {
            return ppl1.distancia.compareTo(ppl2.distancia);
          });
          kmOrder = true;
        });
      } else {
        setState(() {
          barberShopList = barberShopList.reversed.toList();
          kmOrder = false;
        });
      }
    }

    void starOrder() {
      if (!noteOrder) {
        setState(() {
          noteOrder = true;
          barberShopList.sort((BarbershopModel ppl1, BarbershopModel ppl2) {
            return ppl1.star.compareTo(ppl2.star);
          });
          noteOrder = true;
        });
      } else {
        setState(() {
          barberShopList = barberShopList.reversed.toList();
          noteOrder = false;
        });
      }
    }

    void priceOrder() {
      if (!valueOrder) {
        setState(() {
          barberShopList.sort((BarbershopModel ppl1, BarbershopModel ppl2) {
            return ppl1.beardPrice.compareTo(ppl2.beardPrice);
          });
          valueOrder = true;
        });
      } else {
        setState(() {
          barberShopList = barberShopList.reversed.toList();
          valueOrder = false;
        });
      }
    }

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
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        priceOrder();
                                      },
                                      child: ContainerFilterIcon(
                                          cima: valueOrder,
                                          filterName: 'Preço'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        starOrder();
                                      },
                                      child: ContainerFilterIcon(
                                          cima: noteOrder,
                                          filterName: 'Avaliação'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        distanceOrder();
                                      },
                                      child: ContainerFilterIcon(
                                          cima: kmOrder,
                                          filterName: 'Distância'),
                                    ),
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
                                    child: ListView.builder(
                                      itemCount: barberShopList.length,
                                      itemBuilder: (context, index) {
                                        return CardBarberShop(
                                          barberShopName:
                                              barberShopList[index].name,
                                          star: barberShopList[index].star,
                                          distance:
                                              barberShopList[index].distancia,
                                          barbercutPrice:
                                              barberShopList[index].beardPrice,
                                          haircutPrice:
                                              barberShopList[index].hairPrice,
                                          imgBarberShop: imgBarberFelipe,
                                        );
                                      },
                                      physics: const BouncingScrollPhysics(),
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
