import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeEase'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'HomeEase Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () => Navigator.pushNamed(context, '/categories'),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () => Navigator.pushNamed(context, '/favorites'),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () => Navigator.pushNamed(context, '/cart'),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Orders'),
              onTap: () => Navigator.pushNamed(context, '/orders'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () => Navigator.pushNamed(context, '/privacy'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCarouselSlider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Room Inspirations',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: const [
                RoomCard(title: 'Bedroom', imageUrl: 'assets/images/room_bedroom.jpg'),
                RoomCard(title: 'Living Room', imageUrl: 'assets/images/room_living.jpg'),
                RoomCard(title: 'Kitchen', imageUrl: 'assets/images/room_kitchen.jpg'),
                RoomCard(title: 'Dining Room', imageUrl: 'assets/images/room_dining.jpg'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Trending Items',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/categories');
              break;
            case 2:
              Navigator.pushNamed(context, '/favorites');
              break;
            case 3:
              Navigator.pushNamed(context, '/cart');
              break;
          }
        },
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const RoomCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}