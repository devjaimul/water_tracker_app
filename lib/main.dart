import 'package:flutter/material.dart';
import 'package:water_tracker_app/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Tracker App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.teal,foregroundColor: Colors.white)
      ),
      home: const SplashScreen(),
    );
  }
}

