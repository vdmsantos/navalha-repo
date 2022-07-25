import 'package:flutter/material.dart';

import '../../shared/scaffold_pattern.dart';
import 'edit_profile_body.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(bodyPage: BodyEditProfile());
  }
}
