import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 10, left: 18, right: 18),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        image: const DecorationImage(
          image: AssetImage("assets/images/container_background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
