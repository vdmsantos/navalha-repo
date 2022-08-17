import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(const Duration(milliseconds: 5600), () {
      Navigator.of(context).pushReplacement(SlideTransitionAnimation(Login()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 25.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Um novo jeito de marcar o seu corte',
                      speed: const Duration(milliseconds: 150),
                    ),
                  ],
                  isRepeatingAnimation: false,
                  repeatForever: false,
                  // displayFullTextOnTap: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.easeInOutQuart,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.rtl,
                // textDirection: TextDirection.rtl,
                child: page,
              );
            });
}
