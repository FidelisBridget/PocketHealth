import 'package:flutter/material.dart';
import 'pages/checkout.dart';


class CartPage extends StatelessWidget {
  final List<Map<String, String>> cart;

  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${cart.length} items)'),
        backgroundColor: const Color.fromARGB(255, 64, 255, 230),
      ),
      body: cart.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    cart[index]['imageUrl'] ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cart[index]['name'] ?? 'Product'),
                  subtitle: Text('Price: ${cart[index]['price'] ?? '0'}'),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 64, 191),
          ),
          onPressed: () {
            if (cart.isNotEmpty) {
              Navigator.pushNamed(
                context,
                '/checkout',
                arguments: cart, // Pass the cart to checkout page
              );
            }
          },
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}
