import 'package:flutter/material.dart';
import 'package:projeto_1/core/assets.dart';
import 'package:projeto_1/shared/topcontainer_stars_pattern.dart';
import '../../shared/scaffold_pattern.dart';
import '../../shared/topcontainer_pattern.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScaffoldPattern(
      bodyPage: Container(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                // title: Text('Goa', textScaleFactor: 1),
                background: TopContainerPatternStar(
                    star: 2, title: 'The gentleman', profile: barberPhoto),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Container(
                    height: 600,
                    width: 50,
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      // bodyPage: TopContainerPattern(
      //     name: 'The Gentleman', profile: barberPhoto, title: 'the Gentleman'),
    );
  }
}
