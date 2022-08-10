import 'dart:math' as math;

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:projeto_1/core/client_provider.dart';

import '../../../../core/assets.dart';
import '../../edit_profile/edit_profile_page.dart';
import '../../home/home_page.dart';
import '../../schedule/schedule_page.dart';

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
  late int indexpage = 0;
  var _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    final scaffoldKey = GlobalKey<ScaffoldState>();

    void setIndex(int index) {
      setState(() {
        indexpage = index;
        _bottomNavIndex = index;
      });
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: const DrawerWidget(
        name: 'Vinicius',
        photoProfile: imgProfile,
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
            setIndex(9);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: Icon(Icons.home, size: 50),
          // child: const Text('NAVALHA',
          //     style: TextStyle(
          //         fontFamily: 'Bevan',
          //         fontSize: 12,
          //         color: Color.fromARGB(255, 255, 255, 255))),
          // child: const Icon(Icons.home, size: 30),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        icons: const [
          Icons.account_circle_rounded,
          LineIcons.instagram,
          Icons.calendar_month_outlined,
          Icons.settings,
        ],
        iconSize: 27,
        activeIndex: _bottomNavIndex,
        inactiveColor: Colors.white,
        activeColor: Colors.white,
        borderWidth: 0.9,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) {
          switch (index) {
            case 0:
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
                break;
              }
            case 3:
              {
                scaffoldKey.currentState!.openEndDrawer();

                break;
              }
            case 2:
              {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SchedulePage()),
                );
                break;
              }

            default:
          }
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgFundoGeral),
            fit: BoxFit.cover,
          ),
        ),
        child: widget.bodyPage,
      ),
    );
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
                  const NameUser(),
                  const SizedBox(
                    height: 25,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Editar cadastro',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerDrawerSchedule(
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
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

class NameUser extends HookConsumerWidget {
  const NameUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientControler = ref.watch(clientController);
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        clientControler.client!.name.contains(' ')
            ? clientControler.client!.name
                .substring(0, clientControler.client!.name.indexOf(' '))
            : clientControler.client!.name,
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const EditProfilePage()),
          ),
        );
      },
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

class ContainerDrawerSchedule extends StatelessWidget {
  final String textTopic;

  const ContainerDrawerSchedule({
    Key? key,
    required this.textTopic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const SchedulePage()),
          ),
        );
      },
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
