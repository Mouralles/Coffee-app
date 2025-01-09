import 'package:flutter/material.dart';

class Menulateral extends StatefulWidget {
  const Menulateral({super.key});

  @override
  State<Menulateral> createState() => _MenulateralState();
}

class _MenulateralState extends State<Menulateral> {
  final List<String> categories = [
    "Cappuccino",
    "Latte",
    "Americano",
    "Espresso",
    "Flat White",
  ];

  int selectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(56, 35, 42, 100),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Alinha os itens no topo
        children: [
          const SizedBox(height: 20), // Espaço inicial
          ...List.generate(
            categories.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectindex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      color: selectindex == index
                          ? const Color.fromRGBO(239, 227, 200, 50)
                          : const Color.fromRGBO(239, 227, 200, 100),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
