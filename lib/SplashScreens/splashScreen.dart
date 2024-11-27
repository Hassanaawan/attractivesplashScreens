import 'package:flutter/material.dart';
import 'package:test_applications/SplashScreens/mobileSplash.dart';
import 'package:test_applications/SplashScreens/tabSplash.dart';
import 'package:test_applications/SplashScreens/webSplash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Detect the screen width to determine platform size
        if (constraints.maxWidth > 1200) {
          // Web layout
          return WebSplash();
        } else if (constraints.maxWidth > 600) {
          // Tablet layout
          return  TabSplash();
        } else {
          // Mobile layout
          return  MobileSplash();
        }
      },
    );
  }
}