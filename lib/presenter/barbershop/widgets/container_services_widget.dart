import 'package:flutter/material.dart';

class ContainerServices extends StatefulWidget {
  const ContainerServices({Key? key}) : super(key: key);

  @override
  State<ContainerServices> createState() => _ContainerServicesState();
}

class _ContainerServicesState extends State<ContainerServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 34, 34, 34),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 35,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 7,
            ),
            Text(
              'Serviços',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
