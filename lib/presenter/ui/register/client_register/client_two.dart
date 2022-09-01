// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/presenter/ui/register/client_register/client_three.dart';

import '../../../../core/providers.dart';
import '../widgets/button_next_register_widget.dart';
import '../widgets/label_register.dart';
import '../widgets/text_field_register.dart';

class ClientRegisterTwo extends HookConsumerWidget {
  final cpfControler = TextEditingController();
  final cepControler = TextEditingController();

  ClientRegisterTwo({
    Key? key,
  }) : super(key: key);

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
                      child: LabelRegister(text: "Insira seu CPF"),
                    ),
                    TextFieldRegister(input: cpfControler),
                    const SizedBox(height: 10),
                    const LabelRegister(text: "Insira seu CEP"),
                    TextFieldRegister(input: cepControler)
                  ],
                ),

                //Botao proximo daqui pra baixo
              ],
            ),
            ButtonNextRegister(
              button: MaterialButton(
                onPressed: () {
                  client.cep = cepControler.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ClientRegisterThree()),
                    ),
                  );
                },
                child: const Text(
                  "Próximo",
                  style: TextStyle(
                      color: Colors.white,
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
