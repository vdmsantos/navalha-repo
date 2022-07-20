import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/presenter/home/home_page.dart';
import 'dart:math' as math;
import '../presenter/barbershop_page/barber_shop.dart';

class ScaffoldPattern extends StatefulWidget {
  const ScaffoldPattern({
    required this.bodyPage,
    Key? key,
  }) : super(key: key);

  final Widget bodyPage;
  @override
  State<ScaffoldPattern> createState() => _ScaffoldPatternState();
}

class _ScaffoldPatternState extends State<ScaffoldPattern> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        endDrawer: const DrawerWidget(
          name: 'Vinicius',
          photoProfile: profile,
        ),
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        floatingActionButton: SizedBox(
          height: 90,
          width: 90,
          child: FloatingActionButton(
            elevation: 50,
            focusColor: Colors.grey,
            backgroundColor: const Color.fromARGB(255, 42, 42, 42),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text('NAVALHA',
                style: TextStyle(fontFamily: 'Bevan', fontSize: 12)),
            // child: const Icon(Icons.home, size: 30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            backgroundColor: const Color.fromARGB(255, 24, 24, 24),
            icons: const [
              Icons.account_circle_outlined,
              Icons.settings,
              Icons.home,
              Icons.calendar_month_outlined,
            ],
            iconSize: 27,
            inactiveColor: Colors.white,
            activeColor: Colors.white,
            borderColor: const Color.fromARGB(255, 28, 28, 28),
            borderWidth: 0.9,
            activeIndex: 1,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            onTap: (index) {
              _scaffoldKey.currentState!.openEndDrawer();
              // setState(() {
              //   print('object');
              // });
              // Scaffold.of(context).openDrawer();
            }

            //other params
            ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fundofinal2.jfif"),
              fit: BoxFit.cover,
            ),
          ),
          width: size.width,
          height: size.height,
          // color: Colors.black,
          child: widget.bodyPage,
        ));
  }
}

class DrawerWidget extends StatefulWidget {
  final String photoProfile;
  final String name;

  const DrawerWidget({
    Key? key,
    required this.photoProfile,
    required this.name,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfilePhoto(widget: widget),
                  NameUser(widget: widget),
                  const SizedBox(
                    height: 25,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Editar cadastro',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Minha agenda',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Redes sociais',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Sair',
                  ),
                ],
              ),
            ),
          ),
          const DarkLightMode(),
        ],
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DrawerWidget widget;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      backgroundColor: const Color.fromARGB(255, 66, 66, 66),
      child: Image.asset(
        widget.photoProfile,
      ),
    );
  }
}

class ArrowLeft extends StatelessWidget {
  const ArrowLeft({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // hoverColor: ,
      // padding: const EdgeInsets.only(bottom: 60),
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

class NameUser extends StatelessWidget {
  const NameUser({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DrawerWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        widget.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          shadows: [
            Shadow(
              offset: Offset(0, 2),
              blurRadius: 3,
              color: Color.fromARGB(255, 0, 0, 0),
            )
          ],
        ),
      ),
    );
  }
}

class DarkLightMode extends StatelessWidget {
  const DarkLightMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Transform.rotate(
        angle: 320 * math.pi / 180,
        child: const Icon(
          Icons.nightlight,
          color: Colors.white,
          shadows: [
            Shadow(
              offset: Offset(0, 3),
              blurRadius: 5,
              color: Color.fromARGB(255, 0, 0, 0),
            )
          ],
          size: 30,
        ),
      ),
    );
  }
}

class ContainerDrawer1 extends StatelessWidget {
  final String textTopic;

  const ContainerDrawer1({
    Key? key,
    required this.textTopic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 44, 44, 44),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(100, 0, 0, 0),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          title: Center(
            child: Text(textTopic,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
