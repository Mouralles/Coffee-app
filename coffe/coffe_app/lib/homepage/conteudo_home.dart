import 'package:coffe_app/homepage/Details/CoffeDetails.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/homepage/card.dart';

class ConteudoHome extends StatelessWidget {
  const ConteudoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> coffees = [
      {
        "image": "assets/images/coffe.jpg",
        "name": "Café com leite",
        "price": 12.0,
        "rating": 4.5,
        "description":
            "Café da maior e melhor qualidade, com leite vaporizado em nossas máquinas"
      },
      {
        "image": "assets/images/coffe.jpg",
        "name": "café com caramelo",
        "price": 15.0,
        "rating": 4.5,
        "description": "Café cremoso com caramelo e calda de chocolate"
      },
      {
        "image": "assets/images/coffe.jpg",
        "name": "café com mirtilo",
        "price": 20.0,
        "rating": 4.5,
        "description": "café cremoso com calda de mirtilo e geleia de mirtilo"
      },
      {
        "image": "assets/images/coffe.jpg",
        "name": "Dalgona",
        "price": 24.0,
        "rating": 4.5,
        "description": "Café gelado com sorvete de creme e calda a sua escolha."
      },
      {
        "image": "assets/images/coffe.jpg",
        "name": "Classico Americano",
        "price": 7.0,
        "rating": 4.2,
        "description":
            "Café mais fraco e leve, recomendado para os que possuem azia."
      },
      {
        "image": "assets/images/coffe.jpg",
        "name": "Espresso",
        "price": 5.0,
        "rating": 4.1,
        "description":
            "Café filtrado e moido na hora fresquinho para você com maior qualidade possível."
      },
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de colunas
            childAspectRatio: 0.75, // Ajuste da proporção (largura x altura)
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: coffees.length,
          itemBuilder: (context, index) {
            final coffee = coffees[index];
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
                        description: coffee["description"]),
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
