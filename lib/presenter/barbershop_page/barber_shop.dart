import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/shared/topcontainer_stars_pattern.dart';

import '../../shared/scaffold_pattern.dart';
import '../../shared/topcontainer_pattern.dart';

class BarberShopPage extends StatefulWidget {
  const BarberShopPage({super.key});

  @override
  State<BarberShopPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BarberShopPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScaffoldPattern(
      bodyPage: Container(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              expandedHeight: 200.0,
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
                    height: 600,
                    width: 50,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: ContainerServices(filterName: 'Detalhes'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ContainerServices(filterName: 'Serviços'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ContainerServices(filterName: 'Agendar'),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 24, 24, 24),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              RowDetails(
                                firstString: 'Endereço',
                                secondString:
                                    'Rua Antônio da veiga, 416 - Victor Konder - Blumenau- SC',
                              ),
                              RowDetails(
                                firstString: 'Fone',
                                secondString: '(47) 9 9999-9999',
                              ),
                              RowDetails(
                                firstString: 'Aberto',
                                secondString: 'Das 08:00 até 21:00',
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.pin_drop_outlined,
                                      color: Colors.white,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Ver no mapa',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
    );
  }
}

class RowDetails extends StatefulWidget {
  final String firstString;
  final String secondString;

  const RowDetails({
    Key? key,
    required this.firstString,
    required this.secondString,
  }) : super(key: key);

  @override
  State<RowDetails> createState() => _RowDetailsState();
}

class _RowDetailsState extends State<RowDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.firstString,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.secondString,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerServices extends StatelessWidget {
  const ContainerServices({
    Key? key,
    required this.filterName,
  }) : super(key: key);
  final String filterName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 34, 34),
          borderRadius: BorderRadius.circular(5)),
      height: 35,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 7,
          ),
          Text(
            filterName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
