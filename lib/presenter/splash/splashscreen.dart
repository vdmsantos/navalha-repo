import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Home_page()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fundofinal2.jfif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset(
          'assets/images/4.png',
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
