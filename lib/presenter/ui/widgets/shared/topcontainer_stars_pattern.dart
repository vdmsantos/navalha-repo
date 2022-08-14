// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:projeto_1/presenter/ui/home/home_page.dart';

import '../../../../core/assets.dart';
import '../../../../core/providers.dart';

class TopContainerPatternStar extends HookConsumerWidget {
  final String title;
  final String profile;
  final int star;

  const TopContainerPatternStar({
    super.key,
    required this.title,
    required this.profile,
    required this.star,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    // final topContainerPatternStar = ref.watch(topContainerPatternStarProvider);

    List<Widget> starList = [];
    Color noStar;
    Color filledStar;

    darkMode.darkMode
        ? noStar = const Color.fromARGB(255, 98, 93, 93)
        : noStar = const Color.fromARGB(255, 139, 135, 135);

    darkMode.darkMode
        ? filledStar = const Color.fromARGB(255, 255, 255, 255)
        : filledStar = const Color.fromARGB(255, 32, 32, 32);

    starList.clear();
    for (var i = 1; i <= 5; i++) {
      if (i <= star) {
        starList.add(
          Icon(Icons.star, color: filledStar),
        );
      } else {
        starList.add(
          DecoratedIcon(
            icon: Icon(Icons.star, color: noStar),
          ),
        );
      }
    }

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
                  image: AssetImage(imgFundoCadeira),
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
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: darkMode.darkMode ? Colors.white : Colors.black,
                        shadows: [
                          Shadow(
                            offset: const Offset(1, 2),
                            blurRadius: 2,
                            color: darkMode.darkMode
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : Colors.white,
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color:
                              darkMode.darkMode ? Colors.white : Colors.black,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 1,
                              color: darkMode.darkMode
                                  ? const Color.fromARGB(255, 0, 0, 0)
                                  : Colors.white,
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
              decoration: BoxDecoration(
                color: darkMode.darkMode
                    ? const Color.fromARGB(255, 42, 42, 42)
                    : const Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [for (int i = 0; i <= 4; i++) starList[i]],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 112,
          child: CircleAvatar(
            backgroundColor: darkMode.darkMode
                ? Colors.white
                : const Color.fromARGB(255, 42, 42, 42),
            radius: 77,
            child: CircleAvatar(
              backgroundColor: darkMode.darkMode
                  ? const Color.fromARGB(255, 42, 42, 42)
                  : Colors.white,
              radius: 75,
              child: SizedBox(
                child: Image(
                  image: AssetImage(
                    profile,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
