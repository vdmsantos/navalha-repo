import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class BarberListItem extends StatelessWidget {
  BarberListItem({
    Key? key,
  }) : super(key: key);

  final Color background = Color.fromARGB(255, 24, 24, 24);
  final Color fill = Color.fromARGB(255, 34, 34, 34);

  @override
  Widget build(BuildContext context) {
    final double fillPercent = 32.00; //

    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    return Container(
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
                      border: IconBorder(color: Colors.white, width: 1)),
                ),
                DecoratedIcon(
                  icon: Icon(Icons.star, color: fill),
                  decoration: IconDecoration(
                      border: IconBorder(color: Colors.white, width: 1)),
                ),
                DecoratedIcon(
                  icon: Icon(Icons.star, color: fill),
                  decoration: IconDecoration(
                      border: IconBorder(color: Colors.white, width: 1)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
