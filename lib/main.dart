import 'package:flutter/material.dart';
import 'Login_page.dart'; // Mengimpor halaman login milikmu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Di sini kita tentukan halaman pertamanya adalah LoginPage
      home: const LoginPage(),
    );
  }
}