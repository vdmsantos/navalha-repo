import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/providers.dart';
import '../../../core/assets.dart';
import 'barbershop_register/barbershop_one.dart';
import 'client_register/client_one.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: darkMode.darkMode
                ? const AssetImage(imgFundoGeral)
                : const AssetImage(imgFundoGeralLight),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    imgLogoGeral,
                    scale: 1,
                  ),
                  Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      border: darkMode.darkMode
                          ? Border.all(color: Colors.white)
                          : Border.all(color: Colors.black),
                      color: darkMode.darkMode
                          ? const Color.fromRGBO(36, 36, 36, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            print('REGISTE4R 1');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ClientRegisterOne1()),
                              ),
                            );
                          },
                          child: Text(
                            "Sou cliente",
                            style: TextStyle(
                                color: darkMode.darkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      border: darkMode.darkMode
                          ? Border.all(color: Colors.white)
                          : Border.all(color: Colors.black),
                      color: darkMode.darkMode
                          ? const Color.fromRGBO(36, 36, 36, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    const BarberShopRegisterOne()),
                              ),
                            );
                          },
                          child: Text(
                            "Sou uma Barbearia",
                            style: TextStyle(
                                color: darkMode.darkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
