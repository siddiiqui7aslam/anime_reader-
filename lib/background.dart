import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF5722), // Orange color
                Color(0xFFFF9800), // Deep Orange color
                Color(0xFFFFEB3B), // Yellow color
              ],
              begin: Alignment.bottomCenter, // Gradient starts from bottom to top
              end: Alignment.topCenter,
            ),
          ),
        ),
        // Overlay with spears pattern
        _buildSpearPattern(),
        // Child widget
        child,
      ],
    );
  }

  Widget _buildSpearPattern() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/spear_pattern.png'), // Add your spear pattern image here
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}
