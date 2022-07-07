import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/page_2/page_2.dart';

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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
