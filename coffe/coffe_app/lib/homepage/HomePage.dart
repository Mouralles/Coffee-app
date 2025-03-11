import 'package:coffe_app/homepage/conteudo_home.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/homepage/MenuLateral.dart';
import 'package:coffe_app/homepage/searchBar.dart';
import 'package:coffe_app/homepage/bottomNavBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? selectedCategory; // Começa mostrando todos os cafés
  void updateCategory(String? category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 21, 32, 1),
      body: SafeArea(
        child: Row(
          children: [
            // Passa a função para atualizar a categoria
            Menulateral(
              onCategorySelected: updateCategory,
            ),

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
                            fontFamily: 'Fonte',
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Color.fromRGBO(239, 227, 200, 1),
                          ),
                        ),
                        IconButton(
                          color: const Color.fromRGBO(239, 227, 200, 1),
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
                        fontFamily: 'Fonte',
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Color.fromRGBO(239, 227, 200, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Search(),
                  ),
                  const SizedBox(height: 20),

                  // Passa a categoria para o conteúdo
                  ConteudoHome(selectedCategory: selectedCategory),
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
