import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';
import 'services_buttons_widget.dart';

class WrapServicesButtons extends HookConsumerWidget {
  const WrapServicesButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(selectedServiceProvider);

    return Wrap(
      spacing: 10,
      children: [
        SizedBox(
          width: 120,
          child: ServicesButtons(
            text: 'Corte Máquina',
            index: 1,
            // indexSelectedList: indexSelectedList,
            onPressedPush: () {
              services.onServiceSelected(1, false);
            },
            onPressedPop: () {
              services.onServiceSelected(1, true);
            },
          ),
        ),
        SizedBox(
          width: 120,
          child: ServicesButtons(
            text: 'Barba',
            index: 2,
            // indexSelectedList: indexSelectedList,
            onPressedPush: () {
              services.onServiceSelected(2, false);
            },
            onPressedPop: () {
              services.onServiceSelected(2, true);
            },
          ),
        ),
        SizedBox(
          width: 120,
          child: ServicesButtons(
            text: '-',
            index: 3,
            // indexSelectedList: indexSelectedList,
            onPressedPush: () {
              services.onServiceSelected(3, false);
            },
            onPressedPop: () {
              services.onServiceSelected(3, true);
            },
          ),
        ),
        SizedBox(
          width: 120,
          child: ServicesButtons(
            text: 'Corte Tesoura',
            index: 4,
            // indexSelectedList: indexSelectedList,
            onPressedPush: () {
              services.onServiceSelected(4, false);
            },
            onPressedPop: () {
              services.onServiceSelected(4, true);
            },
          ),
        ),
        SizedBox(
          width: 120,
          child: ServicesButtons(
            text: 'Hidratação',
            index: 5,
            // indexSelectedList: indexSelectedList,
            onPressedPush: () {
              services.onServiceSelected(5, false);
            },
            onPressedPop: () {
              services.onServiceSelected(5, true);
            },
          ),
        ),
        SizedBox(
          width: 120,
          child: ServicesButtons(
            text: '-',
            index: 6,
            // indexSelectedList: indexSelectedList,
            onPressedPush: () {
              services.onServiceSelected(6, false);
            },
            onPressedPop: () {
              services.onServiceSelected(6, true);
            },
          ),
        ),
      ],
    );
  }
}
