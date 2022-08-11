// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/core/providers.dart';
import 'package:projeto_1/presenter/ui/login/login_page.dart';
import '../../../../infra/data_sources_deprecated/data_source.dart';
import '../../widgets/shared/alert_dialog.dart';
import '../widgets/button_next_register_widget.dart';
import '../widgets/label_register.dart';
import '../widgets/text_field_register.dart';
import 'client_register_controller.dart';

class ClientRegisterThree extends HookConsumerWidget {
  var daofactory = DataAccess();
  final passwordControler = TextEditingController();
  final passwordConfirmControler = TextEditingController();
  final ClientRegisterController clientProvider;
  final Map<String, dynamic> userParams;

  ClientRegisterThree({
    Key? key,
    required this.clientProvider,
    required this.userParams,
  }) : super(key: key);

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
                      child: LabelRegister(text: "Insira sua senha"),
                    ),
                    const TextFieldRegister(),
                    const SizedBox(height: 10),
                    LabelRegister(text: "Confirme sua senha"),
                    const TextFieldRegister(),
                  ],
                ),

                //Botao proximo daqui pra baixo
              ],
            ),
            ButtonNextRegister(
              button: MaterialButton(
                onPressed: () {
                  if (clientProvider.validPassword(passwordControler.text)) {
                    AlertDialogBarber(
                            page: Login(),
                            buttonColor: Colors.greenAccent,
                            icon: Icons.check_circle_outline_outlined,
                            textbutton: 'Ok',
                            text: 'Cadastro realizado com sucesso!',
                            iconColor: Colors.green)
                        .showCustomDialog(context);
                  }

                  // daofactory.clientdao.delete(1);
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
