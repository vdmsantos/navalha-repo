// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/core/providers.dart';
import 'package:projeto_1/presenter/controller/register_controller.dart';
import 'package:projeto_1/presenter/ui/login/login_page.dart';
import 'package:projeto_1/presenter/ui/register/widgets/text_field_password.dart';
import '../../../../infra/data_sources_deprecated/data_source.dart';
import '../widgets/button_next_register_widget.dart';
import '../widgets/label_register.dart';

class ClientRegisterThree extends HookConsumerWidget {
  final daofactory = DataAccess();
  final passwordControler = TextEditingController();
  final passwordConfirmControler = TextEditingController();

  ClientRegisterThree({
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
                      child: LabelRegister(text: "Insira sua senha"),
                    ),
                    TextFieldPassword(input: passwordControler),
                    const SizedBox(height: 10),
                    const LabelRegister(text: "Confirme sua senha"),
                    TextFieldPassword(input: passwordConfirmControler),
                  ],
                ),
              ],
            ),
            ButtonNextRegister(
              button: MaterialButton(
                onPressed: () async {
                  client.password = passwordControler.text;
                  print("${client.email}  ${client.password!}");
                  RegisterController register = RegisterController();

                  print(await register.addClient(client));

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Login()),
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
