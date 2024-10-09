import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import HomeScreen
import 'background.dart'; // Import the Background widget

void main() {
  runApp(WebtoonExplorerApp());
}

class WebtoonExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webtoon Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Background( // Use the Background widget
          child: Center(
            child: HomeScreen(), // Set HomeScreen as the home page
          ),
        ),
      ),
    );
  }
}
