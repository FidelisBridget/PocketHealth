import 'package:flutter/material.dart';
import 'package:pockethealth_app/pages/cart.dart';
import 'pages/cart.dart';
import 'pages/product_details.dart';
import 'pages/product_details.dart';



class DashboardPage extends StatefulWidget {
  final List<Map<String, String>> cart;

  const DashboardPage({super.key, required this.cart});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Sample products data
  final List<Map<String, String>> products = [
    {
      'name': 'Fitness course',
      'price': '\$79',
      'imageUrl': 'https://www.google.com/imgres?q=fitness&imgurl=https%3A%2F%2Fwww.eatright.org%2F-%2Fmedia%2Fimages%2Featright-landing-pages%2Fphysicalactivitylp_804x482.jpg%3Fas%3D0%26w%3D967%26rev%3D49578a5889d64349a3cc68b2ac762e43%26hash%3D7E56938D92292108240175617FC67FE4&imgrefurl=https%3A%2F%2Fwww.eatright.org%2Ffitness&docid=axVUyBZ1SrpiEM&tbnid=tBvEMaXalFhAqM&vet=12ahUKEwjvuYCanMWJAxWYzwIHHfodCUwQM3oECGkQAA..i&w=967&h=580&hcb=2&ved=2ahUKEwjvuYCanMWJAxWYzwIHHfodCUwQM3oECGkQAA',
      'description': 'Cardio, muscle strengthening and stretches workout.'
    },
    {
      'name': 'Healthy Recipes',
      'price': '\$69',
      'imageUrl': 'https://www.google.com/imgres?q=recipes&imgurl=https%3A%2F%2Fimages.immediate.co.uk%2Fproduction%2Fvolatile%2Fsites%2F30%2F2020%2F08%2Fchorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg%3Fquality%3D90%26resize%3D556%2C505&imgrefurl=https%3A%2F%2Fwww.bbcgoodfood.com%2Frecipes%2Fcollection%2Feasy-recipes&docid=0MYkDl3kvGAUTM&tbnid=zQYVTrlvbSQNAM&vet=12ahUKEwj08dbWmsWJAxUO2QIHHcE2KoUQM3oECBUQAA..i&w=556&h=505&hcb=2&ved=2ahUKEwj08dbWmsWJAxUO2QIHHcE2KoUQM3oECBUQAA',
      'description': 'Healthy recipes for diabetes and hypertension clients.'
    },
    {
      'name': 'Mindfulness Course',
      'price': '\$80',
      'imageUrl': 'https://www.google.com/imgres?q=mindfulness&imgurl=https%3A%2F%2Fwww.mindful.org%2Fcontent%2Fuploads%2FMeditation-Mindfulness-1.jpg&imgrefurl=https%3A%2F%2Fwww.mindful.org%2Fmeditation%2Fmindfulness-getting-started%2F&docid=9q4Q2iEFDFXKJM&tbnid=DfqeEgFAvoUtLM&vet=12ahUKEwi94IWOm8WJAxWLwAIHHUhlFJIQM3oECBYQAA..i&w=3000&h=1875&hcb=2&ved=2ahUKEwi94IWOm8WJAxWLwAIHHUhlFJIQM3oECBYQAA',
      'description': 'Meditation and mindfulness routines for stress management.'
    },
    {
      'name': 'Sleep Assist',
      'price': '\$69',
      'imageUrl': 'https://www.google.com/imgres?q=sleep%20&imgurl=https%3A%2F%2Fassets.clevelandclinic.org%2Ftransform%2Ffed7f081-b51b-4b99-a0ec-9d711b723016%2Fsleeping-night-light-off-1962100702&imgrefurl=https%3A%2F%2Fhealth.clevelandclinic.org%2Flight-night-can-interfere-sleep&docid=kh_zPd59IzedaM&tbnid=7MQN2mZi0Y1X8M&vet=12ahUKEwi9nY3cnMWJAxX_1wIHHSdFMTkQM3oECGUQAA..i&w=2000&h=1125&hcb=2&ved=2ahUKEwi9nY3cnMWJAxX_1wIHHSdFMTkQM3oECGUQAA',
      'description': 'Sleep stories and sounds to help you get quality sleep.'
    },
  ];

  void addToCart(Map<String, String> product) {
    widget.cart.add(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['name']} added to cart!')),
    );
    setState(() {}); // Refresh the UI to reflect the cart count
  }

  void logout() {
    // Handle logout logic here
    Navigator.of(context).pop(); // Navigate back to login or main screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color.fromARGB(255, 64, 201, 255),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (widget.cart.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${widget.cart.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: widget.cart),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            // Product Grid
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to ProductDetailsPage
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            product: product,
                            onAddToCart: addToCart, // Pass addToCart function
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(product['imageUrl']!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product['price']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                ElevatedButton(
                                  onPressed: () {
                                    addToCart(product); // Add product to cart
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrangeAccent,
                                  ),
                                  child: const Text('Add to Cart'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
