import 'package:coffe_app/homepage/conteudo_home.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/homepage/MenuLateral.dart';
import 'package:coffe_app/homepage/searchBar.dart';
import 'package:coffe_app/homepage/bottomNavBar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 21, 32, 100),
      body: SafeArea(
        child: Row(
          children: [
            const Menulateral(),

            // Conteúdo principal

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dejavu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Color.fromRGBO(239, 227, 200, 100),
                          ),
                        ),
                        IconButton(
                          color: const Color.fromRGBO(239, 227, 200, 100),
                          iconSize: 50,
                          onPressed: () {},
                          icon: const Icon(Icons.account_circle_rounded),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Café',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Color.fromRGBO(239, 227, 200, 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Search(),
                  ),
                  const SizedBox(height: 20),
                  const ConteudoHome()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottomnavbar(),
    );
  }
}
