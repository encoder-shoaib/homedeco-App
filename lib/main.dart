import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:homeease/providers/theme_provider.dart';
import 'package:homeease/providers/product_provider.dart';
import 'package:homeease/providers/ai_provider.dart';

// Screens
import 'package:homeease/screens/home_screen.dart';
import 'package:homeease/screens/login_screen.dart';
import 'package:homeease/screens/profile_screen.dart';
import 'package:homeease/screens/settings_screen.dart';
import 'package:homeease/screens/categories_screen.dart';
import 'package:homeease/screens/favorites_screen.dart';
import 'package:homeease/screens/cart_screen.dart';
import 'package:homeease/screens/orders_screen.dart';
import 'package:homeease/screens/privacy_policy_screen.dart';
import 'package:homeease/screens/ai_design_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env file
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => AIProvider()), // AI Design Provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'HomeEase',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,

      // Light Theme
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
        useMaterial3: true,
      ),

      // Dark Theme
      darkTheme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        useMaterial3: true,
      ),

      // Define Initial Route
      initialRoute: '/login',

      // Define Named Routes
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/cart': (context) => const CartScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/privacy': (context) => const PrivacyPolicyScreen(),
        '/ai-design': (context) => const AIDesignScreen(), // New AI Feature
      },
    );
  }
}
