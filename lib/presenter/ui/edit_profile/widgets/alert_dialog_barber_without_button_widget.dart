import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogBarberWithoutButton {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Function showPreview;
  final Function getPreview;

  AlertDialogBarberWithoutButton({
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.showPreview,
    required this.getPreview,
  });

  void baterfoto() {
    Get.to(
      () => CameraCamera(
        onFile: (file) => showPreview(file),
      ),
    );
  }

  void escolhergaleria() {
    getPreview();
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 240,
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(36, 36, 36, 1),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                    icon: const Icon(Icons.attach_file),
                    label: const Text(
                      'Selecione um arquivo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        inherit: false,
                      ),
                    ),
                    // onPressed: () {},
                    onPressed: escolhergaleria),
                const Text(
                  'ou',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    inherit: false,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: baterfoto,
                  // onPressed: () => Get.to(
                  //   () => CameraCamera(
                  //     onFile: (file) => showPreview(file),
                  //   ),
                  // ),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text(
                    'Tire uma foto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      inherit: false,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Cancelar',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
