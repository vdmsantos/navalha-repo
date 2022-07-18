import 'package:flutter/material.dart';

class BottomNavigatorBarber extends StatefulWidget {
  const BottomNavigatorBarber({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigatorBarber> createState() => _BottomNavigatorBarberState();
}

class _BottomNavigatorBarberState extends State<BottomNavigatorBarber> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    setBottomBarIndex(index) {
      setState(() {
        currentIndex = index;
      });
      print(currentIndex);
    }

    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: BNBCustomPainter(),
                ),
                Center(
                  heightFactor: 0.8,
                  child: FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 34, 34, 34),
                      child: Icon(Icons.home, size: 30),
                      // elevation: 700,
                      onPressed: () {}),
                ),
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        splashRadius: 1,
                        icon: Icon(
                          Icons.settings_rounded,
                          size: 30,
                          color: currentIndex == 0
                              ? Colors.white
                              : Color.fromARGB(255, 24, 24, 24),
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                        },
                        splashColor: Colors.white,
                      ),
                      Container(
                        width: size.width * 0.17,
                      ),
                      IconButton(
                          splashRadius: 1,
                          icon: Icon(
                            Icons.notifications,
                            color: currentIndex == 3
                                ? Colors.white
                                : Color.fromARGB(255, 24, 24, 24),
                            size: 30,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = const Color.fromARGB(255, 34, 34, 34)
      ..style = PaintingStyle.fill;

    Path path = Path();
    // path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
