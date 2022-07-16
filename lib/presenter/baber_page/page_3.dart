import 'package:flutter/material.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<page3> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

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
          children: [],
        ),
      ),
    );
  }
}
