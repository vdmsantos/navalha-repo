import 'package:flutter/material.dart';

class page5 extends StatefulWidget {
  const page5({super.key});

  @override
  State<page5> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<page5> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page 5'),
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
