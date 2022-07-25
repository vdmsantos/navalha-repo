import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/assets.dart';
import '../../infra/model/user_model.dart';
import '../../shared/scaffold_pattern.dart';
import '../../shared/topcontainer_pattern.dart';
import 'widgets/list_schedule_containers.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsuarioModel usuario = GetIt.I.get<UsuarioModel>();

    return ScaffoldPattern(
      bodyPage: Column(
        children: [
          TopContainerPattern(
              title: 'Minha Agenda',
              name: usuario.userName!.contains(' ')
                  ? usuario.userName!
                      .substring(0, usuario.userName!.indexOf(' '))
                  : usuario.userName!,
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
