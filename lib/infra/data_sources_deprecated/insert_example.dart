import 'package:flutter/material.dart';

import '../../presenter/ui/calendar/calendar_page.dart';
import '../model/user_model.dart';
import 'data_source.dart';

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CalendarPage(
                      null,
                      nameBarberSelect: '',
                    ),
                  ),
                );
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
                  );
                  daofactory.clientdao.insert(userModel);
                  daofactory.clientdao.select();
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
