import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Page3> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page 3'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.of(context).push(
        //             MaterialPageRoute(builder: (context) => const page3()));
        //       },
        //       icon: const Icon(Icons.arrow_circle_right_sharp))
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
        ),
      ),
    );
  }
}
