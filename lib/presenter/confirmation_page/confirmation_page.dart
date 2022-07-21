import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/confirmation_page/confirmation_body.dart';
import 'package:projeto_1/presenter/home/widgets/body_home.dart';
import '../../shared/scaffold_pattern.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPattern(bodyPage: BodyConfirmation());
  }
}