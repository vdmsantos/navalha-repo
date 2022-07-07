import 'package:flutter/material.dart';

import 'presenter/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home_page(),
    );
  }
}
