import 'package:flutter/material.dart';
import '../../../core/assets.dart';
import '../login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool passoutempo = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        passoutempo = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgFundoGeral),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment:
              passoutempo ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                onEnd: () {
                  Future.delayed(const Duration(seconds: 1)).then((value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  });
                },
                height: passoutempo ? 300 : 400,
                duration: const Duration(milliseconds: 200),
                child: Hero(
                  tag: 'ronaldo',
                  child: Image.asset(
                    fit: BoxFit.cover,
                    imgLogoGeral,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
