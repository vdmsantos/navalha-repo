import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:projeto_1/data_sources/data_source.dart';
import 'package:projeto_1/model/user_model.dart';
import 'package:projeto_1/presenter/barbershop_page/page_1.dart';

import '../calendar_page/page_2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

    var DAOfactory = DataAccess();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Page 1'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => page2()));
            },
            icon: Icon(Icons.arrow_circle_right_sharp))
      ]),
      body: Container(
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Container(
                      color: Color.fromARGB(255, 172, 43, 43),
                      height: 100,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
