import 'package:flutter/material.dart';
import 'package:projeto_1/data_sources/data_source.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Color(0xFFFFFFFF))),
            ),
            padding: const EdgeInsets.only(top: 22, left: 25, right: 15),
            child: Container(
              padding: const EdgeInsets.all(13),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bom dia,',
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                      Text('Vinícius',
                          style: TextStyle(fontSize: 23, color: Colors.white)),
                    ],
                  ),
                  Icon(
                    size: 45,
                    Icons.menu_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
