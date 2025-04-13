import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simulate login
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Simulate registration
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/privacy'),
              child: const Text('View Privacy Policy'),
            ),
          ],
        ),
      ),
    );
  }
}