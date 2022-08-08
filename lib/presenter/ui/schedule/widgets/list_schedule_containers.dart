import 'package:flutter/material.dart';

import '../../calendar/widgets/calendar_widget.dart';
import '../../calendar/widgets/wrap_hour_buttons.dart';
import 'container_finished_widget.dart';
import 'container_pending_widget.dart';

class ListScheduleContainers extends StatelessWidget {
  const ListScheduleContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: ContainerPending(
            berbercutPrice: 12,
            haircutPrice: 25,
            barberShopName: 'Packers Barbearia',
            dayOfService: daySelected,
            hourOfService: hourSelected.toString(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: ContainerFinished(
            berbercutPrice: 12,
            haircutPrice: 25,
            barberShopName: "Beto's Barbearia",
            dayOfService: 'qua, 20/07',
            hourOfService: '13:00',
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: ContainerFinished(
            berbercutPrice: 12,
            haircutPrice: 25,
            barberShopName: 'Outsider Barbearia',
            dayOfService: 'sex, 17/06',
            hourOfService: '16:30',
          ),
        ),
      ],
    );
  }
}
