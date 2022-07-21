import 'package:flutter/material.dart';
import '../../shared/scaffold_pattern.dart';
import 'confirmation_page_body.dart';

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