import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/baber_page/page_3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page 2'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Page3()));
              },
              icon: const Icon(Icons.arrow_circle_right_sharp))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
        ),
      ),
    );
  }
}
