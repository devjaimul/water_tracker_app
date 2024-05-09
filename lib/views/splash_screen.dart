import 'dart:async';
import 'package:flutter/material.dart';
import 'package:water_tracker_app/views/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.water_drop_outlined,color: Colors.teal.withOpacity(0.7),size: 150,),
          const Text("Water Tracker App",style: TextStyle(color: Colors.teal,fontSize: 20,fontWeight: FontWeight.w600),)
        ],),
      ),
    );
  }
}