import 'package:flutter/material.dart';

import '../../../shared/row_details.dart';

class ContainerDetailsBarberShop extends StatelessWidget {
  final String andress;
  final String phone;
  final String hoursOpen;

  const ContainerDetailsBarberShop({
    Key? key,
    required this.andress,
    required this.phone,
    required this.hoursOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 24, 24, 24),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          RowDetails(
            firstString: 'Endereço:',
            secondString: andress,
          ),
          RowDetails(
            firstString: 'Fone:',
            secondString: phone,
          ),
          RowDetails(
            firstString: 'Aberto:',
            secondString: hoursOpen,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.pin_drop_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Ver no mapa',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
