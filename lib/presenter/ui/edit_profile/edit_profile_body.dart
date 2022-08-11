import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_1/core/providers.dart';
import 'package:projeto_1/infra/model/adress_model.dart';

import '../home/home_page.dart';
import 'widgets/anexo_widget.dart';
import 'widgets/label_edit_profile_widget.dart';
import 'widgets/text_field_edit_profile_widget.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BodyEditingProfile(),
    );
  }
}

class BodyEditingProfile extends HookConsumerWidget {
  BodyEditingProfile({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cepController = TextEditingController();
  final bairroController = TextEditingController();
  final logradouroController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientControler = ref.watch(clientProvider);
    final darkMode = ref.watch(darkModeProvider);

    void setUserInfo() {
      nameController.text = clientControler.client!.name;
      emailController.text = clientControler.client!.email;
      passwordController.text = clientControler.client!.password;
    }

    setUserInfo();

    return ListView(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'Alterar foto:',
                    style: TextStyle(
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Anexo(),
                  LabelEditProfile(darkMode: darkMode, text: 'Nome'),
                  TextFieldEditProfile(nameController: nameController),
                  const SizedBox(height: 15),
                  LabelEditProfile(darkMode: darkMode, text: 'E-mail'),
                  TextFieldEditProfile(nameController: nameController),
                  FutureBuilder(
                    future: clientControler.getClientAdress(),
                    builder: (context, AsyncSnapshot<AdressModel?> snapshot) {
                      if (snapshot.data != null) {
                        cepController.text = snapshot.data!.cep;
                        bairroController.text = snapshot.data!.bairro;
                        logradouroController.text = snapshot.data!.logradouro;
                      }

                      switch (snapshot.connectionState) {
                        case ConnectionState.done:

                          // emailController.text = snapshot.data!.cep;
                          return Column(
                            children: [
                              const SizedBox(height: 15),
                              LabelEditProfile(darkMode: darkMode, text: 'Cep'),
                              TextFieldEditProfile(
                                  nameController: nameController),
                              const SizedBox(height: 15),
                              LabelEditProfile(
                                  darkMode: darkMode, text: 'Bairro'),
                              TextFieldEditProfile(
                                  nameController: nameController),
                              const SizedBox(height: 15),
                              LabelEditProfile(
                                  darkMode: darkMode, text: 'Logradouro'),
                              TextFieldEditProfile(
                                  nameController: nameController),
                            ],
                          );

                        default:
                          {
                            return Column(
                              children: const [
                                SizedBox(height: 20),
                                CircularProgressIndicator(),
                              ],
                            );
                          }
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  LabelEditProfile(darkMode: darkMode, text: 'Celular'),
                  TextFieldEditProfile(nameController: nameController),
                  const SizedBox(height: 15),
                  LabelEditProfile(
                      darkMode: darkMode, text: 'Data de Nascimento'),
                  TextFieldEditProfile(nameController: nameController),
                  const SizedBox(height: 15),
                  LabelEditProfile(darkMode: darkMode, text: 'Senha'),
                  TextFieldEditProfile(nameController: nameController),
                  const SizedBox(height: 15),
                  LabelEditProfile(darkMode: darkMode, text: 'Confirmar'),
                  TextFieldEditProfile(nameController: nameController),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50, bottom: 50),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            width: 135,
                            height: 45,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(36, 36, 36, 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            const HomePage()),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Confirmar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
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
            ],
          ),
        ),
      ],
    );
  }
}

class PreviewPage extends StatelessWidget {
  final File file;

  const PreviewPage({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned.fill(
                child: Image.file(file, fit: BoxFit.cover),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                          icon: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () => Get.back(result: file),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
