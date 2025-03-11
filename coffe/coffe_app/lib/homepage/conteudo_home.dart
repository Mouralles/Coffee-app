import 'package:flutter/material.dart';
import 'package:coffe_app/homepage/Details/CoffeDetails.dart';
import 'package:coffe_app/homepage/card.dart';

class ConteudoHome extends StatelessWidget {
  final String? selectedCategory;

  const ConteudoHome({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> coffees = [
      {
        "image": "assets/images/coffe.jpg",
        "name": "Café com leite",
        "price": 12.0,
        "rating": 4.5,
        "description": "Café com leite vaporizado",
        "category": "Latte"
      },
      {
        "image": "assets/images/café_com_caramelo.jpg",
        "name": "Café com caramelo",
        "price": 15.0,
        "rating": 4.5,
        "description": "Café cremoso com caramelo",
        "category": "Latte"
      },
      {
        "image": "assets/images/café_dalgona.jpg",
        "name": "Café dalgona",
        "price": 12.0,
        "rating": 4.5,
        "description": "Café cremoso e suave",
        "category": "Latte"
      },
      {
        "image": "assets/images/café_americano.jpg",
        "name": "Clássico Americano",
        "price": 7.0,
        "rating": 4.2,
        "description": "Café leve e suave",
        "category": "Americano"
      },
      {
        "image": "assets/images/espresso.jpg",
        "name": "Espresso",
        "price": 5.0,
        "rating": 4.1,
        "description": "Café forte e intenso",
        "category": "Espresso"
      },
      {
        "image": "assets/images/café_chocolate.jpg",
        "name": "Café com chocolate",
        "price": 10.0,
        "rating": 5.0,
        "description": "Café cremoso com chocolate",
        "category": "Chocolate"
      },
    ];

    // Se nenhuma categoria for selecionada, mostra todos os cafés
    final filteredCoffees = selectedCategory == null
        ? coffees
        : coffees
            .where((coffee) => coffee["category"] == selectedCategory)
            .toList();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: filteredCoffees.length,
          itemBuilder: (context, index) {
            final coffee = filteredCoffees[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoffeDetails(
                      image: coffee["image"]!,
                      name: coffee["name"]!,
                      price: coffee["price"] as double,
                      rating: coffee["rating"] as double,
                      description: coffee["description"],
                    ),
                  ),
                );
              },
              child: CustomCard(
                image: coffee["image"]!,
                name: coffee["name"]!,
                price: coffee["price"] as double,
                rating: coffee["rating"] as double,
              ),
            );
          },
        ),
      ),
    );
  }
}
