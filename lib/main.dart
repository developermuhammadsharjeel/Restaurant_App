import 'dart:async';
import 'package:flutter/material.dart';
import 'Pages/page1.dart'; // <-- Your HomePage file (change path if needed)
import 'resource/picture.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to HomePage after 3 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background splash image
          Image.asset(
            Images.splash, // <-- Replace with your image path
            fit: BoxFit.cover,
          ),

          // Bottom info overlay
          Align(
            alignment: Alignment.topRight,

            child: Padding(

              padding: const EdgeInsets.only(top: 80, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    Images.splash, // <-- Your logo image
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Made By Sharjeel",
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
