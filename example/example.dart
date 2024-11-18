import 'package:flutter/material.dart';
import 'package:check_animation/check_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckAnimationScreen(
                  title: 'Welcome to Check Animation',
                  buttonText: 'Start',
                  onButtonPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          child: Text('Go to Animation'),
        ),
      ),
    );
  }
}
