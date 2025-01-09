class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
