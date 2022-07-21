import 'package:flutter/material.dart';

class ContainerFilterIcon extends StatelessWidget {
  const ContainerFilterIcon({
    Key? key,
    required this.filterName,
  }) : super(key: key);
  final String filterName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 34, 34),
          borderRadius: BorderRadius.circular(5)),
      height: 35,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 7,
          ),
          Text(
            filterName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Icon(
            Icons.arrow_drop_down_sharp,
            color: Colors.white,
          )
        ],
      )),
    );
  }
}
