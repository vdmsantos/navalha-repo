import 'package:flutter/material.dart';
import 'package:projeto_1/core/assets.dart';

import '../../shared/scaffold_pattern.dart';
import '../../shared/topcontainer_pattern.dart';
import 'widgets/list_schedule_containers.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      bodyPage: Column(
        children: [
          const TopContainerPattern(
              title: 'Minha Agenda', name: 'Vinícius', profile: profile),
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
