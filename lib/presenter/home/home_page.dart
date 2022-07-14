import 'package:flutter/material.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/data_sources/data_source.dart';
import 'package:projeto_1/model/user_model.dart';
import 'package:projeto_1/presenter/page_1/page_1.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _MyWidgetState();
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

class _MyWidgetState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

    var DAOfactory = DataAccess();

    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Color(0xFFFFFFFF))),
            ),
            // padding: EdgeInsets.only(top: 20, right: 15, left: 15),
            padding: EdgeInsets.only(top: 22, left: 25, right: 15),
            child: Container(
              padding: EdgeInsets.all(13),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Bom dia!',
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                      Text('Vinícius',
                          style: TextStyle(fontSize: 23, color: Colors.white))
                    ],
                  ),
                  Column(
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        size: 45,
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Row(
              children: [
                SizedBox(
                    width: 100, height: 100, child: Image.asset(LogoBarber)),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Não perca mais tempo na fila do barbeiro, agende o seu por aqui e agora',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 50,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
