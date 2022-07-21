// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:projeto_1/presenter/home/widgets/body_home.dart';

import '../../shared/scaffold_pattern.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.scaffoldKeymed,
  }) : super(key: key);
  final GlobalKey? scaffoldKeymed;
  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(bodyPage: BodyHome(scaffoldKey: scaffoldKeymed));
  }
}
