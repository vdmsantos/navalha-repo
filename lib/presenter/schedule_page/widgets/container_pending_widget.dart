import 'package:flutter/material.dart';

class ContainerPending extends StatefulWidget {
  const ContainerPending({
    Key? key,
    required this.berbercutPrice,
    required this.haircutPrice,
    required this.barberShopName,
    this.topColor = const Color.fromARGB(255, 24, 24, 24),
    this.bottomCollor = const Color.fromARGB(255, 34, 34, 34),
   
    required this.dayOfService,
    required this.hourOfService,
  }) : super(key: key);

  final double berbercutPrice;
  final double haircutPrice;
  final String barberShopName;
  final Color topColor;
  final Color bottomCollor;
  
  final String dayOfService;
  final String hourOfService;

  @override
  State<ContainerPending> createState() => _ContainerPendingState();
}

class _ContainerPendingState extends State<ContainerPending> {
  @override
  Widget build(BuildContext context) {
    double fillPercent = 32.00; //

    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    final List<Color> gradient = [
      widget.topColor,
      widget.topColor,
      widget.bottomCollor,
      widget.bottomCollor,
    ];
    return Container(
      height: 140,
      padding: const EdgeInsets.only(top: 8, left: 15),
      width: 320,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            stops: stops,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 24, 24, 24)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.barberShopName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Cabelo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              const Text(
                'Barba',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 170),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'R\$ 37,00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'R\$',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${widget.haircutPrice.toInt()},',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'R\$',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${widget.berbercutPrice.toInt()},',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
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
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.dayOfService,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Text(
                          widget.hourOfService,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 120),
                        const Text(
                          'Pendente',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
