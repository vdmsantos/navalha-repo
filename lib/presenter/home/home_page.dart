import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/home/widgets/body_home.dart';
import 'package:projeto_1/shared/bottom_navigationbar.dart';
import 'package:projeto_1/shared/bottom_navigationbarber.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        floatingActionButton: SizedBox(
          height: 70,
          width: 80,
          child: FloatingActionButton(
            child: Icon(Icons.home, size: 30),
            focusColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 34, 34, 34),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 24, 24, 24),
          icons: [
            Icons.settings,
            Icons.schedule,
          ],
          iconSize: 30,
          activeColor: Colors.white,

          borderColor: const Color.fromARGB(255, 66, 66, 66),
          borderWidth: 0.5,
          activeIndex: 1,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) => setState(() {}),
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
          child: const BodyHome(),
        ));
  }
}
