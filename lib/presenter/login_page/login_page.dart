import 'package:flutter/material.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/presenter/register_page/register_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(fundoGeral),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logoGeral,
                scale: 1,
              ),
              Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(36, 36, 36, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "E-mail",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(85, 85, 85, 1),fontSize: 20
                      ),
                    ),
                    style: TextStyle(color: Colors.white,fontSize: 18),
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
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Senha",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(85, 85, 85, 1),fontSize: 20
                      ),
                    ),
                    style: TextStyle(color: Colors.white,fontSize: 18),
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
              Container(
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
                          color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
