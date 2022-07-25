import 'package:flutter/material.dart';

import '../../shared/scaffold_pattern.dart';
import 'editing_profile_body.dart';

class EditingProfilePage extends StatefulWidget {
  const EditingProfilePage({super.key});

  @override
  State<EditingProfilePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditingProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPattern(bodyPage: Edit());
  }
}
