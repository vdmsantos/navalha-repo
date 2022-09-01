// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/ui/home/widgets/body_home.dart';

import '../widgets/shared/scaffold_pattern.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPattern(bodyPage: BodyHome());
  }
}
