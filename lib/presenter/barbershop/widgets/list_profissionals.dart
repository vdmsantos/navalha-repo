import 'package:flutter/material.dart';

import '../../../core/assets.dart';
import 'container_profissionals.dart';

class ListProfessionals extends StatelessWidget {
  const ListProfessionals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Expanded(
        child: ListView(
          children: const [
            SizedBox(height: 20),
            ContainerProfissionals(
              barberName: 'Lucas',
              photoProfile: barber6,
            ),
            ContainerProfissionals(
              barberName: 'Vitor',
              photoProfile: barber7,
            ),
            ContainerProfissionals(
              barberName: 'Maria',
              photoProfile: barber1,
            ),
            ContainerProfissionals(
              barberName: 'Guilherme',
              photoProfile: barber4,
            ),
            ContainerProfissionals(
              barberName: 'Fellipe',
              photoProfile: barber5,
            ),
            ContainerProfissionals(
              barberName: 'Vinícius',
              photoProfile: barber2,
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
