import 'package:flutter/material.dart';

import 'container_list_services_widget.dart';

class ListServices extends StatelessWidget {
  const ListServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Expanded(
        flex: 1,
        child: ListView(
          children: const [
            SizedBox(height: 20),
            ContainerListServices(price: '35,00', service: 'Corte tesoura'),
            ContainerListServices(price: '25,00', service: 'Corte máquina'),
            ContainerListServices(price: '30,00', service: 'Barba'),
            ContainerListServices(price: '60,00', service: 'Cabelo e barba'),
            ContainerListServices(price: '15,00', service: 'Hidratação'),
            ContainerListServices(price: '55,00', service: 'Combo pai e filho'),
            ContainerListServices(price: '40,00', service: 'Tingimento cabelo'),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
