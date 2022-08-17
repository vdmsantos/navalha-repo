import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/assets.dart';
import '../edit_profile_body.dart';
import 'alert_dialog_barber_without_button_widget.dart';

class Anexo extends StatefulWidget {
  const Anexo({
    Key? key,
  }) : super(key: key);

  @override
  State<Anexo> createState() => _AnexoState();
}

class _AnexoState extends State<Anexo> {
  File? arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(
        () => arquivo = File(
          file.path,
        ),
      );
    }
  }

  showPreview(file) async {
    file = await Get.to(
      () => PreviewPage(file: file),
    );

    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: SizedBox(
            height: 10,
            width: 10,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: !(arquivo == null)
                      ? Image.file(arquivo!, fit: BoxFit.cover)
                      : Image.asset(
                          imgProfile1,
                          fit: BoxFit.cover,
                        ),
                ),
                const CircleAvatar(
                  radius: 75,
                  backgroundColor: Color.fromARGB(132, 0, 0, 0),
                ),
                Positioned(
                  top: 40,
                  left: 40,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_a_photo_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      AlertDialogBarberWithoutButton(
                              showPreview: showPreview,
                              getPreview: getFileFromGallery,
                              icon: Icons.add_a_photo_rounded,
                              iconColor: Colors.white,
                              text: 'asdfdsasd')
                          .showCustomDialog(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
