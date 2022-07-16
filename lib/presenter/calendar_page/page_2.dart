import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/baber_page/page_3.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<page2> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page 2'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const page3()));
              },
              icon: const Icon(Icons.arrow_circle_right_sharp))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
