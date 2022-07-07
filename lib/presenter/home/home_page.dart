import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/page_1/page_1.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Page1()));
              },
              icon: Icon(Icons.arrow_circle_right_sharp))
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
