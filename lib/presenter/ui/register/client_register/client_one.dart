import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/providers.dart';

import '../../../../core/assets.dart';
import '../widgets/button_next_register_widget.dart';
import '../widgets/label_register.dart';
import '../widgets/text_field_register.dart';
import 'client_register_controller.dart';
import 'client_two.dart';

class ClientRegisterOne1 extends HookConsumerWidget {
  final nameControler = TextEditingController();
  final emailControler = TextEditingController();

  final Map<String, dynamic> userParams = {
    'id': null,
    'name': null,
    'email': null,
    'password': null,
    'cpf': null,
    'cep': null
  };

  ClientRegisterOne1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    ClientRegisterController clientControler = ClientRegisterController();

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: darkMode.darkMode
                ? const AssetImage(imgFundoGeral)
                : const AssetImage(imgFundoGeralLight),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: LabelRegister(text: "Insira seu nome"),
                    ),
                    TextFieldRegister(input: nameControler),
                    const SizedBox(height: 10),
                    LabelRegister(text: "Insira seu e-mail"),
                    TextFieldRegister(input: emailControler),
                  ],
                ),

                //Botao proximo daqui pra baixo
              ],
            ),
            ButtonNextRegister(
              button: MaterialButton(
                onPressed: () {
                  clientControler.validName(nameControler.text);
                  clientControler.validEmail(emailControler.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ClientRegisterTwo(
                            clientProvider: clientControler,
                            userParams: userParams,
                          )),
                    ),
                  );
                },
                child: Text(
                  "Próximo",
                  style: TextStyle(
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
