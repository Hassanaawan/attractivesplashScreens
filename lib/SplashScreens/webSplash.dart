import 'dart:math';
import 'package:flutter/material.dart';

class WebSplash extends StatefulWidget {
  @override
  _WebSplashState createState() => _WebSplashState();
}

class _WebSplashState extends State<WebSplash> {
  final int gridSize = 4; // Number of rows and columns
  bool rearrange = false;

  @override
  void initState() {
    super.initState();
    // Trigger the rearrangement animation after a short delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        rearrange = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 15, 15),
      body: Center(
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
                );
              }),
            );
          },
        ),
      ),
    );
  }
}