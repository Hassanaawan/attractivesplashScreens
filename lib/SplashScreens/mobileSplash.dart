import 'dart:math';
import 'package:flutter/material.dart';

class MobileSplash extends StatefulWidget {
  @override
  _MobileSplashState createState() => _MobileSplashState();
}

class _MobileSplashState extends State<MobileSplash> with TickerProviderStateMixin {
  final int gridSize = 4; // Number of rows and columns
  bool rearrange = false;
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the opacity animation
    _opacityController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _opacityController,
      curve: Curves.easeIn,
    ));

    _opacityController.forward();

    // Trigger the rearrangement animation immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        rearrange = true;
      });
    });
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Gradient Background
          AnimatedContainer(
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red.shade800,
                  Colors.red.shade400,
                  Colors.red.shade200,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double imageSize = min(constraints.maxWidth, constraints.maxHeight) * 0.8;
                  double pieceSize = imageSize / gridSize;

                  return Stack(
                    children: List.generate(gridSize * gridSize, (index) {
                      int row = index ~/ gridSize;
                      int col = index % gridSize;

                      // Initial random positions
                      double startX = Random().nextDouble() * constraints.maxWidth;
                      double startY = Random().nextDouble() * constraints.maxHeight;

                      // Target positions in the grid
                      double targetX = (constraints.maxWidth - imageSize) / 2 + col * pieceSize;
                      double targetY = (constraints.maxHeight - imageSize) / 2 + row * pieceSize;

                      return AnimatedPositioned(
                        duration: Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        left: rearrange ? targetX : startX,
                        top: rearrange ? targetY : startY,
                        child: Transform.scale(
                          scale: rearrange ? 1.0 : 0.8, // Slight scaling effect
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment(
                                -1 + (2 / (gridSize - 1)) * col,
                                -1 + (2 / (gridSize - 1)) * row,
                              ),
                              widthFactor: 1 / gridSize,
                              heightFactor: 1 / gridSize,
                              child: Image.asset(
                                'assets/92news.png',
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
          // Overlay Text
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Text(
                  "Welcome to 92 News",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
