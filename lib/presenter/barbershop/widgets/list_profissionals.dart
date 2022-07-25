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
              photoProfile: imgBarberLucas,
            ),
            ContainerProfissionals(
              barberName: 'Vitor',
              photoProfile: imgBarberVitor,
            ),
            ContainerProfissionals(
              barberName: 'Maria',
              photoProfile: imgBarberMaria,
            ),
            ContainerProfissionals(
              barberName: 'Guilherme',
              photoProfile: imgBarberGuilherme,
            ),
            ContainerProfissionals(
              barberName: 'Fellipe',
              photoProfile: imgBarberFelipe,
            ),
            ContainerProfissionals(
              barberName: 'Vinícius',
              photoProfile: imgBarberVinicius,
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
