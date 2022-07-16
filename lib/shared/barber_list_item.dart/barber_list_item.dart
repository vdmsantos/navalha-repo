import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Color background = Color.fromARGB(255, 24, 24, 24);
  final Color fill = Color.fromARGB(255, 34, 34, 34);

  final double fillPercent = 32.00; // fills 56.23% for container from bottom

  @override
  Widget build(BuildContext context) {
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];

    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
              height: 130,
              padding: EdgeInsets.only(top: 15, right: 15, left: 15),
              width: MediaQuery.of(context).size.width - 70,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradient,
                    stops: stops,
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 24, 24, 24)),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Packers barbearia',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 11),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(width: 7),
                      Text(
                        'Cabelo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        'Barba',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '25,',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            // textAlign: TextAlign.end,
                            '00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'R\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '30,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            // textAlign: TextAlign.end,
                            '00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '25 km',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Icon(Icons.star, color: Colors.white, shadows: []),
                        Icon(Icons.star, color: Colors.white),
                        DecoratedIcon(
                          icon: Icon(Icons.star, color: fill),
                          decoration: IconDecoration(
                              border:
                                  IconBorder(color: Colors.white, width: 1)),
                        ),
                        DecoratedIcon(
                          icon: Icon(Icons.star, color: fill),
                          decoration: IconDecoration(
                              border:
                                  IconBorder(color: Colors.white, width: 1)),
                        ),
                        DecoratedIcon(
                          icon: Icon(Icons.star, color: fill),
                          decoration: IconDecoration(
                              border:
                                  IconBorder(color: Colors.white, width: 1)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
