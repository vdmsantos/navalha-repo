// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../core/assets.dart';

class TopContainerPatternStar extends StatefulWidget {
  final String title;
  final String profile;

  const TopContainerPatternStar({
    Key? key,
    required this.title,
    required this.profile,
    required this.star,
  }) : super(key: key);
  final int star;

  @override
  State<TopContainerPatternStar> createState() =>
      _TopContainerPatternStarState();
}

class _TopContainerPatternStarState extends State<TopContainerPatternStar> {
  Color topColor = const Color.fromARGB(255, 24, 24, 24);
  Color bottomCollor = const Color.fromARGB(255, 34, 34, 34);

  List<Widget> starList = [];
  @override
  initState() {
    super.initState();
    setStarList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 80,
                  image: AssetImage(fundoCadeira),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(3, 5),
                            blurRadius: 2,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(3, 5),
                              blurRadius: 2,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 80),
              width: double.maxFinite,
              height: 60,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 66, 66, 66),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [for (int i = 0; i <= 4; i++) starList[i]],
                  )),
            ),
          ],
        ),
        Positioned(
          top: 112,
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 42, 42, 42),
            radius: 75,
            child: SizedBox(
              child: Image(
                image: AssetImage(
                  widget.profile,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setStarList() {
    for (var i = 1; i <= 5; i++) {
      if (i <= widget.star) {
        starList.add(
          const Icon(Icons.star, color: Colors.white, shadows: []),
        );
      } else {
        starList.add(
          DecoratedIcon(
            // decoration: IconDecoration(shadows: [
            //   BoxShadow(
            //       color: Color.fromARGB(255, 128, 128, 128), blurRadius: 3)
            // ]),
            icon: Icon(Icons.star, color: bottomCollor),
            // decoration: const IconDecoration(
            //     border: IconBorder(color: Colors.white, width: 2)),
          ),
        );
      }
    }
  }
}
