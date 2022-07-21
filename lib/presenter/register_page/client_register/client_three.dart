// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/model/user_model.dart';
import 'package:projeto_1/shared/alert_dialog.dart';

import '../../../data_sources/data_source.dart';
import '../../login_page/login_page.dart';

class ClientRegisterThree extends StatefulWidget {
  const ClientRegisterThree({
    Key? key,
    required this.userParams,
  }) : super(key: key);

  final Map<String, dynamic> userParams;

  @override
  State<ClientRegisterThree> createState() => _ClientRegisterThreeState();
}

class _ClientRegisterThreeState extends State<ClientRegisterThree> {
  var daofactory = DataAccess();
  final passwordControler = TextEditingController();
  final passwordConfirmControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(fundoGeral),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 350,
                        child: Text(
                          "Insira sua senha",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
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
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: 350,
                      child: Text(
                        "Confirme sua senha",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 70,
                        width: 350,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(36, 36, 36, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: TextField(
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Botao proximo daqui pra baixo
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 50, bottom: 30),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(36, 36, 36, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                // widget.userParams['password'] =
                                //     passwordControler.text;

                                // var userModel = UsuarioModel(
                                //   widget.userParams['name'],
                                //   widget.userParams['email'],
                                //   widget.userParams['password'],
                                //   widget.userParams['cpf'],
                                //   widget.userParams['cep'],
                                // );
                                // // print(userModel.toString());
                                // // print(userModel.toMap());
                                // // print(userModel.toJson());
                                // daofactory.clientdao.insert(userModel);
                                daofactory.clientdao.select();
                                // daofactory.clientdao.delete(1);
                              },
                              child: const Text(
                                "Próximo",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      right: -30,
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Color.fromRGBO(48, 48, 48, 1),
                        child: Icon(
                          Icons.check_circle_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
