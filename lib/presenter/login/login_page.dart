import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/assets.dart';
import '../../infra/data_sources/data_source.dart';
import '../../shared/alert_dialog.dart';
import '../../shared/alert_dialog_withoutbutton.dart';
import '../home/home_page.dart';
import '../register/register_page.dart';
import 'login_controler.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    GetIt.I.reset();
  }

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginController loginController = LoginController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imgFundoGeral),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
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
                          color: Color.fromRGBO(85, 85, 85, 1), fontSize: 20),
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
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
                          color: Color.fromRGBO(85, 85, 85, 1), fontSize: 20),
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
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
                          fontSize: 11,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  if (await loginController.validLogin(
                      emailControler.text, passwordControler.text)) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage(
                              scaffoldKeymed: null,
                            )));
                  } else {
                    AlertDialogBarberWithoutButton(
                            text: 'Login inválido, tente novamente',
                            icon: Icons.error,
                            iconColor: Colors.redAccent)
                        .showCustomDialog(context);
                  }
                  // daofactory.clientdao.delete(1);
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
