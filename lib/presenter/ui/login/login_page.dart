import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/providers.dart';

import '../../../core/assets.dart';
import '../home/home_page.dart';
import '../register/register_page.dart';
import 'alert_dialog_barber_without_button_login_widget.dart';

class Login extends HookConsumerWidget {
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientControler = ref.watch(clientProvider);

    return Scaffold(
      body: Container(
        height: 1000,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imgLogoBarber2,
              ),
              Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(36, 36, 36, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: TextField(
                    controller: emailControler,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "E-mail",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(85, 85, 85, 1),
                        fontSize: 20,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(36, 36, 36, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: TextField(
                    controller: passwordControler,
                    decoration: const InputDecoration(
                      hintText: "Senha",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(85, 85, 85, 1),
                        fontSize: 20,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(
                            color:
                                Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  await clientControler.getClientByEmailPassword(
                      emailControler.text, passwordControler.text);

                  if (!clientControler.isNull()) {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    AlertDialogBarberWithoutButtonLogin(
                            text: 'Login inválido, tente novamente',
                            icon: Icons.error,
                            iconColor: Colors.redAccent)
                        .showCustomDialog(context);
                  }
                  // if (clientControler.client != null) {
                  //   print(' id : ${clientControler.client!.id}');
                  //   print(' name : ${clientControler.client!.name}');
                  //   print(' email : ${clientControler.client!.email}');
                  //   print(' paswword : ${clientControler.client!.password}');
                  //   print(' cep : ${clientControler.client!.cep}');
                  //   print(' cpf : ${clientControler.client!.cpf}');
                  // }
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(36, 36, 36, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Entrar",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
