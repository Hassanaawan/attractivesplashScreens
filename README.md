## Mobile Splash Screen with Animated Image Assembly
This Flutter project demonstrates an animated splash screen where an image breaks into smaller fragments, scatters randomly across the screen, and then reassembles to its original form in the center. The splash screen is named MobileSplash and is fully customizable.

## Features
🎨 Dynamic Animation: An engaging effect where the image fragments animate into their correct positions.
🔢 Customizable Grid Size: Adjust how many parts the image is broken into (e.g., 3x3, 4x4).
📱 Responsive Design: Works seamlessly across mobile, tablet, and web platforms.
🚀 Smooth Transitions: Uses Flutter's AnimatedPositioned and animation curves for high-quality effects.
## Technical Overview
1. Grid-Based Fragmentation
The provided image is divided into smaller rectangular fragments using:
ClipRect for defining each fragment.
Align to position them correctly within the grid.
2. Randomized Initial Positions
Each fragment starts at a random position within the screen using the Random class.
3. Animated Reassembly
Flutter’s AnimatedPositioned widget animates each fragment to its correct position in the grid.
The animation starts as soon as the widget is built.
Getting Started
1. Prerequisites
Install Flutter on your system. Follow the official guide here.
A Flutter-compatible IDE such as Android Studio, VS Code, or IntelliJ.
2. Clone This Repository
bash
Copy code
git clone https://github.com/your-username/mobile-splash-animation.git
cd mobile-splash-animation
3. Add Your Image
Place your desired image in the assets folder (e.g., assets/92news.png).
Update your pubspec.yaml file to declare the asset:
yaml
Copy code
flutter:
  assets:
    - assets/92news.png
4. Run the App
Start the app using the Flutter CLI:
bash
Copy code
flutter run
## How It Works
The MobileSplash screen splits the image into a grid of smaller fragments (gridSize x gridSize).
Initially, these fragments are scattered randomly across the screen.
Using AnimatedPositioned, the fragments move to their correct positions to recreate the original image.
Customization
1. Adjust Grid Size
Modify the gridSize variable in the code to change the number of rows and columns:
dart
Copy code
final int gridSize = 4; // Change to 3 for a 3x3 grid, etc.
2. Change the Image
Replace assets/92news.png with your desired image.
Update the pubspec.yaml file if needed.
Code Structure
Key Widgets
Stack: Used to overlay image fragments on top of each other.
AnimatedPositioned: Animates each fragment from a random position to its correct location.
ClipRect: Clips each grid cell for image fragmentation.