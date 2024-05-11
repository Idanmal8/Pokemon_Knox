import 'package:flutter/material.dart';

class PokeballThrowAnimationBox extends StatefulWidget {
  final bool isPokeballAnimationVisible;

  const PokeballThrowAnimationBox({
    required this.isPokeballAnimationVisible,
    super.key,
  });

  @override
  State<PokeballThrowAnimationBox> createState() =>
      _PokeballThrowAnimationBoxState();
}

class _PokeballThrowAnimationBoxState extends State<PokeballThrowAnimationBox>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _animationRight;
  late Animation<double> _animationDown;
  late Animation<double> _animationRotation;

  @override
  void initState() {
    super.initState();

    // Initialize the controller
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Horizontal movement (from 0 to 1/4 of the screen width)
    _animationRight = Tween(begin: 0.0, end: 0.25).animate(controller);

    // Vertical movement with a curved effect to simulate gravity
    _animationDown = CurvedAnimation(
      parent: controller,
      curve:
          Curves.easeInOutCubic, // This curve simulates the effect of gravity
    );

    // Rotation animation
    _animationRotation =
        Tween(begin: 0.0, end: 4.0).animate(controller); // Multiple rotations

    if (widget.isPokeballAnimationVisible) {
      controller.forward();
    }
  }

  @override
  void didUpdateWidget(PokeballThrowAnimationBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPokeballAnimationVisible) {
      controller.forward(from: 0.0); // Restart the animation
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const screenHeight = 300;

    return Container(
      width: screenWidth,
      alignment: Alignment.centerLeft,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double xValue = _animationRight.value * screenWidth * 4;
          double yValue = _animationDown.value *
              screenHeight *
              2; // Adjust multiplier for desired throw height

          // Apply the rotation within the transformation
          return Transform.translate(
            offset: Offset(xValue, yValue),
            child: Transform.rotate(
              angle: _animationRotation.value * 2 * 3.14, // Full rotation
              child: child,
            ),
          );
        },
        child: Image.asset(
          'assets/pokeballs/Pokeball.png',
          fit: BoxFit.contain,
          scale: 8,
        ),
      ),
    );
  }
}
