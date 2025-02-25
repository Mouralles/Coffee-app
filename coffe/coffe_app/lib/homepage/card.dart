import 'package:coffe_app/Product.dart';
import 'package:coffe_app/cartpage/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final double rating;

  const CustomCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(54, 44, 54, 100),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem do card
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 120, // Ajuste de altura da imagem
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Espaço para texto e botão
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Título
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2, // Limita o texto a 2 linhas
                    overflow:
                        TextOverflow.ellipsis, // Exibe "..." para texto longo
                  ),

                  // Preço e botão na mesma linha
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(74, 65, 74, 100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R\$${price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Product product = Product(
                              name: name,
                              price: price,
                              imageUrl: image,
                            );

                            Provider.of<CartProvider>(context, listen: false)
                                .addItem(product);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$name adicionado ao carrinho!'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(8),
                            backgroundColor:
                                const Color.fromRGBO(239, 227, 200, 1),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
