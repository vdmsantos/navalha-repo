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
    // Future.delayed(const Duration(seconds: 3)).then((value) {
    //   Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => const Home_page()),
    //   );
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/LogoBarber.png', scale: 1),
          ],
        ),
      ),
    );
  }
}
