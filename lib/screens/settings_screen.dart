import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('English'),
            onTap: () {
              // Implement language selection
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Language selection coming soon')),
              );
            },
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            value: true,
            onChanged: (value) {
              // Implement notification toggle
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notification settings coming soon')),
              );
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () => Navigator.pushNamed(context, '/privacy'),
          ),
        ],
      ),
    );
  }
}