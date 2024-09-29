import 'package:flutter/material.dart';
import 'package:rentalmotor/login_screen.dart';
import 'package:rentalmotor/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental Motor Bali',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set halaman login sebagai halaman awal
      initialRoute: '/login',
      routes: {
        // Route untuk halaman login
        '/login': (context) => const LoginScreen(),
        // Route untuk halaman utama (MainScreen)
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
