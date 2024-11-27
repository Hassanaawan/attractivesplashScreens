import 'package:flutter/material.dart';

class TabSplash extends StatefulWidget {
  @override
  _TabSplashState createState() => _TabSplashState();
}

class _TabSplashState extends State<TabSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration of one 360° rotation
    );

    // Repeat the animation indefinitely
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("360° Image Rotation"),
      ),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}