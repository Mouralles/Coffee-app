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
            const IconThemeData(color: Color.fromRGBO(239, 227, 200, 100)),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                'Carrinho está vazio',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        leading: item.product.imageUrl != true &&
                                item.product.imageUrl.isNotEmpty
                            ? Image.network(item.product.imageUrl)
                            : const Icon(Icons
                                .image), // Exibe um ícone se não houver imagem
                        title: Text(item.product.name),
                        subtitle: Text(
                          'R\\${item.product.price.toStringAsFixed(2)}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (item.quantity > 1) {
                                  cart.updateQuantity(
                                      item.product, item.quantity - 1);
                                } else {
                                  cart.removeItem(item.product);
                                }
                              },
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cart.updateQuantity(
                                    item.product, item.quantity + 1);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total: R\\${cart.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navegar para a página de pagamento (implemente aqui)
                        },
                        child: const Text('Finalizar Compra'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
