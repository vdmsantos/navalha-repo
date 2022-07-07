import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/page_5/page_5.dart';

class page4 extends StatefulWidget {
  const page4({super.key});

  @override
  State<page4> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<page4> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page 4'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const page5()));
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
