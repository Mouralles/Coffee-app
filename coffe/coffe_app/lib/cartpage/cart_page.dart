// ignore_for_file: unnecessary_null_comparison

import 'package:coffe_app/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 21, 32, 100),
        iconTheme:
            const IconThemeData(color: Color.fromRGBO(239, 227, 200, 0.973)),
        title: const Text(
          'Carrinho',
          style: TextStyle(
              fontFamily: 'Fonte', color: Color.fromRGBO(239, 227, 200, 0.973)),
        ),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                'Carrinho está vazio',
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(239, 227, 200, 1)),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return _buildCartItem(context, item, cart);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Total: R\$${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(239, 227, 200, 0.973)),
                          onPressed: () {
                            if (cart.items.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('O carrinho está vazio!'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            } else {
                              cart.clearCart();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Compra finalizada com sucesso!'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: const Text('Finalizar Compra',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(74, 43, 41, 1))),
                        ),
                      ]),
                ),
              ],
            ),
    );
  }

  Widget _buildCartItem(
      BuildContext context, CartItem item, CartProvider cart) {
    return ListTile(
      leading: item.product.imageUrl != null && item.product.imageUrl.isNotEmpty
          ? Container(
              width: 50, // Largura fixa
              height: 50, // Altura fixa
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item.product.imageUrl, // Caminho da imagem
                  fit: BoxFit.cover, // Ajusta a imagem ao espaço
                ),
              ),
            )
          : const Icon(
              Icons.image), // Ícone padrão se a URL estiver vazia ou nula
      title: Text(
        item.product.name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'R\$${item.product.price.toStringAsFixed(2)}',
        style: const TextStyle(color: Color.fromRGBO(241, 241, 241, 0.808)),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Botão de remover quantidade
          Container(
            width: 40, // Aumenta o tamanho do container
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(239, 227, 200, 0.973),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Color.fromRGBO(0, 0, 0, 0.612),
                ),
                onPressed: () {
                  if (item.quantity > 1) {
                    cart.updateQuantity(item.product, item.quantity - 1);
                  } else {
                    cart.removeItem(item.product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${item.product.name} removido do carrinho!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: 16), // Aumenta o espaçamento
          Text(
            item.quantity.toString(),
            style: const TextStyle(
                fontSize: 18, color: Color.fromARGB(172, 255, 255, 255)),
          ),
          const SizedBox(width: 16), // Aumenta o espaçamento
          // Botão de adicionar quantidade
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(239, 227, 200, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Color.fromRGBO(0, 0, 0, 0.612),
                ),
                onPressed: () {
                  cart.updateQuantity(item.product, item.quantity + 1);
                },
              ),
            ),
          ),
          const SizedBox(width: 16), // Aumenta o espaçamento
          // Botão de remover item
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 105, 95),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  cart.removeItem(item.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('${item.product.name} removido do carrinho!'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
