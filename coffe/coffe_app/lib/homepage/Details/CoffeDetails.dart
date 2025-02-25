import 'package:coffe_app/Product.dart';
import 'package:coffe_app/cartpage/cart_page.dart';
import 'package:coffe_app/cartpage/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeDetails extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final double rating;
  final String description;

  const CoffeDetails({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
  });

  @override
  _CoffeDetailsState createState() => _CoffeDetailsState();
}

class _CoffeDetailsState extends State<CoffeDetails> {
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 21, 32, 100),
        iconTheme:
            const IconThemeData(color: Color.fromRGBO(239, 227, 200, 100)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(239, 227, 200, 0.973),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "R\$${widget.price.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 4),
                const Icon(Icons.star, color: Colors.yellow),
                Text(
                  widget.rating.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(239, 227, 200, 100),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Selecione o adicional',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSelectableButton('Leite adicional'),
                  const SizedBox(width: 8),
                  _buildSelectableButton('Chocolate adicional'),
                  const SizedBox(width: 8),
                  _buildSelectableButton('Opção gelada'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(239, 227, 200, 0.973),
                ),
                child: TextButton(
                  onPressed: () async {
                    // Criando um objeto Product com os dados da tela
                    Product selectedProduct = Product(
                      name: widget.name,
                      price: widget.price,
                      imageUrl: widget.image,
                    );

                    // Adicionando ao carrinho
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(selectedProduct);

                    // Exibindo um SnackBar de feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.name} adicionado ao carrinho!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );

                    // Aguardando o SnackBar ser exibido antes de navegar
                    await Future.delayed(const Duration(seconds: 1));

                    // Navegando para a página do carrinho
                    if (mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartPage()),
                      );
                    }
                  },
                  child: const Text(
                    'Compre agora',
                    style: TextStyle(
                      color: Color.fromRGBO(94, 16, 94, 0.612),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableButton(String label) {
    final bool isSelected = _selectedOption == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = isSelected ? '' : label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(239, 227, 200, 0.973)
              : const Color.fromRGBO(94, 16, 94, 0.612),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color:
                isSelected ? const Color.fromRGBO(32, 21, 32, 1) : Colors.white,
          ),
        ),
      ),
    );
  }
}
