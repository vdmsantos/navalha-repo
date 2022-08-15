import 'dart:math' as math;

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:projeto_1/core/providers.dart';
import 'package:projeto_1/presenter/ui/login/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/assets.dart';
import '../../edit_profile/edit_profile_page.dart';
import '../../home/home_page.dart';
import '../../schedule/schedule_page.dart';


const String urlInsta =
"https://www.instagram.com/warrenbrasil/";

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}
class ScaffoldPattern extends HookConsumerWidget {
  final Widget bodyPage;

  const ScaffoldPattern({required this.bodyPage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final index = ref.watch(indexProvider);
    final darkMode = ref.watch(darkModeProvider);

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: const DrawerWidget(
        name: 'Vinicius',
        photoProfile: imgProfile,
      ),
      backgroundColor: darkMode.darkMode
          ? const Color.fromARGB(255, 24, 24, 24)
          : const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: SizedBox(
        height: 90,
        width: 90,
        child: FloatingActionButton(
          elevation: 50,
          focusColor: darkMode.darkMode
              ? Colors.grey
              : const Color.fromARGB(255, 61, 56, 56),
          backgroundColor: const Color.fromARGB(255, 42, 42, 42),
          onPressed: () {
            index.setIndex(9);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: const Icon(Icons.home, size: 50),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: darkMode.darkMode
            ? const Color.fromARGB(255, 24, 24, 24)
            : const Color.fromARGB(255, 255, 255, 255),
        icons: const [
          Icons.account_circle_rounded,
          LineIcons.instagram,
          Icons.calendar_month_outlined,
          Icons.settings,
        ],
        iconSize: 27,
        activeIndex: index.bottomNavIndex,
        inactiveColor: darkMode.darkMode
            ? Colors.white
            : const Color.fromARGB(255, 42, 42, 42),
        activeColor: darkMode.darkMode
            ? Colors.white
            : const Color.fromARGB(255, 42, 42, 42),
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
              case 1:
              {
                _launchUrl(urlInsta);

                break;
              }

            default:
          }
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: darkMode.darkMode
                ? const AssetImage(imgFundoGeral)
                : const AssetImage(imgFundoGeralLight),
            fit: BoxFit.cover,
          ),
        ),
        child: bodyPage,
      ),
    );
  }
}

class DrawerWidget extends HookConsumerWidget {
  final String photoProfile;
  final String name;

  const DrawerWidget({
    super.key,
    required this.photoProfile,
    required this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(20),
        ),
      ),
      backgroundColor: darkMode.darkMode
          ? const Color.fromARGB(255, 44, 44, 44)
          : const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: darkMode.darkMode
                        ? const Color.fromARGB(255, 255, 253, 253)
                        : const Color.fromARGB(255, 83, 80, 80),
                    child: Image.asset(
                      photoProfile,
                    ),
                  ),
                  const NameUser(),
                  const SizedBox(
                    height: 25,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Editar cadastro',
                    index: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Minha agenda',
                    index: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Redes sociais',
                    index: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerDrawer1(
                    textTopic: 'Sair',
                    index: 4,
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

class ProfilePhoto extends HookConsumerWidget {
  const ProfilePhoto({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DrawerWidget widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return CircleAvatar(
      radius: 80,
      backgroundColor: darkMode.darkMode
          ? const Color.fromARGB(255, 255, 253, 253)
          : const Color.fromARGB(255, 83, 80, 80),
      child: Image.asset(
        widget.photoProfile,
      ),
    );
  }
}

class ArrowLeft extends HookConsumerWidget {
  const ArrowLeft({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: darkMode.darkMode ? Colors.white : Colors.black,
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
    final clientControler = ref.watch(clientProvider);
    final darkMode = ref.watch(darkModeProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        clientControler.client!.name.contains(' ')
            ? clientControler.client!.name
                .substring(0, clientControler.client!.name.indexOf(' '))
            : clientControler.client!.name,
        style: TextStyle(
          color: darkMode.darkMode ? Colors.white : Colors.black,
          fontSize: 22,
          shadows: const [
            Shadow(
              offset: Offset(0, 2),
              blurRadius: 1,
              color: Color.fromARGB(255, 0, 0, 0),
            )
          ],
        ),
      ),
    );
  }
}

class DarkLightMode extends HookConsumerWidget {
  const DarkLightMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        ref.watch(darkModeProvider).changeMode(!darkMode.darkMode);
      },
      child: Transform.rotate(
        angle: 320 * math.pi / 180,
        child: Icon(
          Icons.nightlight,
          color: darkMode.darkMode ? Colors.white : Colors.black,
          shadows: const [
            Shadow(
              offset: Offset(0, 3),
              blurRadius: 1,
              color: Color.fromARGB(255, 0, 0, 0),
            )
          ],
          size: 30,
        ),
      ),
    );
  }
}

class ContainerDrawer1 extends HookConsumerWidget {
  final String textTopic;
  final int index;

  const ContainerDrawer1({
    Key? key,
    required this.textTopic,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              if (index == 1) {
                return const EditProfilePage();
              } else if (index == 2) {
                return const SchedulePage();
              } else if (index == 3) {
                _launchUrl(urlInsta);
              } else if (index == 4) {
                return Login();
              }
              //return const EditProfilePage();
              return const HomePage();
            }),
          ),
        );
      },
      child: Ink(
        decoration: BoxDecoration(
          color: darkMode.darkMode
              ? const Color.fromARGB(36, 36, 36, 1)
              : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(30),
          border: darkMode.darkMode
              ? Border.all(color: Colors.white)
              : Border.all(color: Colors.black),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(100, 0, 0, 0),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          title: Center(
            child: Text(
              textTopic,
              style: TextStyle(
                color: darkMode.darkMode
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(36, 36, 36, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 1,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerDrawerSchedule extends HookConsumerWidget {
  final String textTopic;

  const ContainerDrawerSchedule({
    Key? key,
    required this.textTopic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

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
          color: darkMode.darkMode
              ? const Color.fromARGB(36, 36, 36, 1)
              : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(30),
          border: darkMode.darkMode
              ? Border.all(color: Colors.white)
              : Border.all(color: Colors.black),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(100, 0, 0, 0),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          title: Center(
            child: Text(
              textTopic,
              style: TextStyle(
                color: darkMode.darkMode
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(36, 36, 36, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 1,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
