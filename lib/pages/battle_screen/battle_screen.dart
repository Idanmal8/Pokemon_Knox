import 'package:flutter/material.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    Size screenSize = MediaQuery.of(context).size;

    // Assuming you know the original aspect ratio of the grass_field image
    // For example, let's say the original image size is 1000 (width) x 500 (height)
    double originalWidth = 455;
    double originalHeight = 212;

    // Calculate the aspect ratio of the image
    double aspectRatio = originalWidth / originalHeight;

    // Calculate the height that the image will occupy on the screen
    double imageHeight = screenSize.width / aspectRatio;

    // Determine if the device is an iPad-size by checking the width
    bool isTablet = screenSize.width > 600;

    // Define width and height scaling factors
    double heightScale = isTablet ? 0.3 : 0.6; // Larger scale for tablet

    return Scaffold(
      appBar: AppBar(
        title: Text('Battle', style: Theme.of(context).textTheme.headlineLarge),
        iconTheme: IconTheme.of(context),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: screenSize.width,
            height: imageHeight, // Set the height of the container
            child: Image.asset(
              'assets/fields/grass_field.png',
              fit: BoxFit.cover, // Use BoxFit.cover to preserve the aspect ratio
            ),
          ),
          Positioned(
            left: 0, 
            bottom: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: screenSize.width / 2,
              height: screenSize.height,
              child: Image.asset('assets/fields/steelix.png', scale: heightScale,),
            ),
          ),
          Positioned(
            right: 0, 
            top: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: screenSize.width / 2,
              height: (imageHeight / 3) * 2,
              child: Image.asset('assets/fields/machamp.png', fit: BoxFit.contain, scale: heightScale),
            ),
          ),
        ],
      ),
    );
  }
}
