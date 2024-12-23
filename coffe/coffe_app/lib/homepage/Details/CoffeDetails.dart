import 'package:flutter/material.dart';

class CoffeDetails extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 21, 32, 100),
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
                  image,
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "R\$${price.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, color: Colors.yellow),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                const SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(239, 227, 200, 100),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'testando',
              style: TextStyle(color: Colors.blue),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.amber,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('teste'),
                  ),
                ),
                Container(
                  color: Colors.amber,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('teste'),
                  ),
                ),
                Container(
                  color: Colors.amber,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('teste'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
