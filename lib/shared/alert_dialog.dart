// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AlertDialogBarber {
  AlertDialogBarber({
    required this.textbutton,
    required this.text,
    required this.icon,
    required this.buttonColor,
    this.page,
    required this.iconColor,
  });
  final String textbutton;
  final String text;
  final IconData icon;
  final Color buttonColor;
  final Widget? page;
  final Color iconColor;

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
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(36, 36, 36, 1),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  size: 100,
                  color: iconColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.none)),
                ),
                Container(
                    width: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: ElevatedButton(
                      onPressed: () {
                        if (page != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => page!));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(buttonColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(
                                          color: Colors.transparent)))),
                      child: Text(
                        textbutton,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ))
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
