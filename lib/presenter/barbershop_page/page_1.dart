import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import '../calendar_page/page_2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.shopping_cart, title: "Basket")
          ],
          onTabChangedListener: (position) {
            setState(() {
              // currentPage = position;
            });
          },
        ),
        appBar:
            AppBar(centerTitle: true, title: const Text('Page 1'), actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Page2()));
              },
              icon: const Icon(Icons.arrow_circle_right_sharp))
        ]),
        body: Container());
  }
}
