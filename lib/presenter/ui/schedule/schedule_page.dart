import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_1/core/client_provider.dart';

import '../../../core/assets.dart';
import '../widgets/shared/scaffold_pattern.dart';
import '../widgets/shared/topcontainer_pattern.dart';
import 'widgets/list_schedule_containers.dart';

class SchedulePage extends HookConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientControler = ref.watch(clientController);
    // UsuarioModel usuario = GetIt.I.get<UsuarioModel>();

    return ScaffoldPattern(
      bodyPage: Column(
        children: [
          TopContainerPattern(
              title: 'Minha Agenda',
              name: clientControler.client!.name.contains(' ')
                  ? clientControler.client!.name
                      .substring(0, clientControler.client!.name.indexOf(' '))
                  : clientControler.client!.name,
              profile: imgProfile),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RefreshIndicator(
                displacement: 25,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                backgroundColor: const Color.fromARGB(255, 34, 34, 34),
                color: Colors.white,
                onRefresh: () => _reloadListItem(),
                child: const ListScheduleContainers(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _reloadListItem() async {
    Future.delayed(const Duration(milliseconds: 1500), () {});
  }
}
