import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/providers.dart';

import '../../../../core/assets.dart';
import '../widgets/button_next_register_widget.dart';
import '../widgets/label_register.dart';
import '../widgets/text_field_register.dart';
import 'client_two.dart';

class ClientRegisterOne1 extends HookConsumerWidget {
  final nameControler = TextEditingController();
  final emailControler = TextEditingController();

  ClientRegisterOne1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    var client = ref.watch(clientRegister);

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
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: LabelRegister(text: "Insira seu nome"),
                    ),
                    TextFieldRegister(input: nameControler),
                    const SizedBox(height: 10),
                    const LabelRegister(text: "Insira seu e-mail"),
                    TextFieldRegister(input: emailControler),
                  ],
                ),

                //Botao proximo daqui pra baixo
              ],
            ),
            ButtonNextRegister(
              button: MaterialButton(
                // splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  client.name = nameControler.text;
                  client.email = emailControler.text;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ClientRegisterTwo()),
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
