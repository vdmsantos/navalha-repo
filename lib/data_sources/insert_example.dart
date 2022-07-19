import 'package:flutter/material.dart';
import 'package:projeto_1/data_sources/data_source.dart';
import 'package:projeto_1/model/user_model.dart';

import '../presenter/calendar_page/calendar_page.dart';

class InsetExample extends StatefulWidget {
  const InsetExample({super.key});

  @override
  State<InsetExample> createState() => _MyWidgetState();
}

//vitor
//generic ui to building data classes
//how to get data access
/*
        DataAccess methods
 var DAOfactory = DataAccess();
 DAOfactory.userData.insert(userModel);
 DAOfactory.userData.select();

*/

class _MyWidgetState extends State<InsetExample> {
  final nameControler = TextEditingController();
  final emailControler = TextEditingController();
  final senhaControler = TextEditingController();
  final datanascControler = TextEditingController();
  final cidadeControler = TextEditingController();
  final enderecoControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var daofactory = DataAccess();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page 1'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CalendarPage()));
              },
              icon: const Icon(Icons.arrow_circle_right_sharp))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameControler,
                decoration: const InputDecoration(
                  hintText: 'Nome',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: emailControler,
                decoration: const InputDecoration(
                  hintText: 'e-mail',
                ),
              ),
              TextField(
                controller: senhaControler,
                decoration: const InputDecoration(
                  hintText: 'senha',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: datanascControler,
                decoration: const InputDecoration(
                  hintText: 'data de nascimento',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: cidadeControler,
                decoration: const InputDecoration(
                  hintText: 'Cidade',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: enderecoControler,
                decoration: const InputDecoration(
                  hintText: 'Endereço',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () {
                  var userModel = UsuarioModel(
                      nameControler.text,
                      emailControler.text,
                      senhaControler.text,
                      datanascControler.text,
                      cidadeControler.text,
                      enderecoControler.text);
                  print(userModel.toString());
                  print(userModel.toMap());
                  print(userModel.toJson());
                  daofactory.userData.insert(userModel);
                  daofactory.userData.select();
                },
                height: 50,
                child: const Text('Cadastrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
