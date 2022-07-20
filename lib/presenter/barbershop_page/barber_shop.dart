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
              expandedHeight: 260,
              flexibleSpace: FlexibleSpaceBar(
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
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (currentIndex == 0)
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : Color.fromARGB(255, 34, 34, 34),
                                        boxShadow: [
                                          BoxShadow(
                                            color: (currentIndex == 0)
                                                ? const Color.fromARGB(
                                                    255, 255, 255, 255)
                                                : const Color.fromARGB(
                                                    0, 94, 94, 94),
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 35,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            'Detalhes',
                                            style: TextStyle(
                                                color: (currentIndex == 0)
                                                    ? const Color.fromARGB(
                                                        255, 189, 189, 189)
                                                    : const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (currentIndex == 1)
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : Color.fromARGB(255, 34, 34, 34),
                                        boxShadow: [
                                          BoxShadow(
                                            color: (currentIndex == 1)
                                                ? const Color.fromARGB(
                                                    255, 255, 255, 255)
                                                : Color.fromARGB(0, 94, 94, 94),
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 35,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            'Serviços',
                                            style: TextStyle(
                                                color: (currentIndex == 1)
                                                    ? const Color.fromARGB(
                                                        255, 189, 189, 189)
                                                    : const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (currentIndex == 2)
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : Color.fromARGB(255, 34, 34, 34),
                                        boxShadow: [
                                          BoxShadow(
                                            color: (currentIndex == 2)
                                                ? const Color.fromARGB(
                                                    255, 255, 255, 255)
                                                : const Color.fromARGB(
                                                    0, 94, 94, 94),
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 35,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            'Agendar',
                                            style: TextStyle(
                                                color: (currentIndex == 2)
                                                    ? const Color.fromARGB(
                                                        255, 189, 189, 189)
                                                    : const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                        if (currentIndex == 0)
                          const ContainerDetailsBarberShop(),
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

class ListProfessionals extends StatelessWidget {
  const ListProfessionals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          ContainerProfissionals(),
          ContainerProfissionals(),
          ContainerProfissionals(),
          ContainerProfissionals(),
        ],
      ),
    );
  }
}

class ContainerProfissionals extends StatelessWidget {
  const ContainerProfissionals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Chamou a pagina do barbeiro');
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
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      'Cristiano',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
                  radius: 45,
                  backgroundColor: const Color.fromARGB(255, 24, 24, 24),
                  child: Image.asset('assets/images/profile.png')),
            ),
          ],
        ),
      ),
    );
  }
}

class ListServices extends StatelessWidget {
  const ListServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          ContainerListServices(),
          ContainerListServices(),
          ContainerListServices(),
          ContainerListServices(),
          ContainerListServices(),
          ContainerListServices(),
          ContainerListServices(),
          ContainerListServices(),
          ContainerListServices(),
          ContainerListServices(),
        ],
      ),
    );
  }
}

class ContainerListServices extends StatelessWidget {
  const ContainerListServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 24, 24, 24),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Corte tesoura',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              child: Row(
                children: const [
                  Text(
                    'R\$',
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '35,00',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerDetailsBarberShop extends StatelessWidget {
  const ContainerDetailsBarberShop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 24, 24, 24),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const RowDetails(
            firstString: 'Endereço:',
            secondString:
                'Rua Antônio da veiga, 416 - Victor Konder - Blumenau- SC',
          ),
          const RowDetails(
            firstString: 'Fone:',
            secondString: '(47) 9 9999-9999',
          ),
          const RowDetails(
            firstString: 'Aberto:',
            secondString: 'Das 08:00 até 21:00',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.pin_drop_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Ver no mapa',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
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
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.secondString,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerServices extends StatefulWidget {
  const ContainerServices({Key? key}) : super(key: key);

  @override
  State<ContainerServices> createState() => _ContainerServicesState();
}

class _ContainerServicesState extends State<ContainerServices> {
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
          children: const [
            SizedBox(
              width: 7,
            ),
            Text(
              'Serviços',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
