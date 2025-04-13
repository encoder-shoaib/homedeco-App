import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal, // Default color
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white, // Icon color
              ),
              // Removed: backgroundImage: AssetImage('assets/images/favicon.png'),
            ),
            const SizedBox(height: 16),
            const Text('John Doe', style: TextStyle(fontSize: 24)),
            const Text('john.doe@example.com'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}