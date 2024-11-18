# Check Animation Package

This package provides a customizable animation screen for Flutter applications, allowing users to easily integrate animations into their apps.

## Features

- Animated screen transitions
- Customizable colors and text
- Easy integration with existing Flutter applications

<p align="center">
  <img src="https://i.imgur.com/tsj1cNV.gif" width="250" height="600" />
</p>

## Getting started

To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  check_animation: ^0.0.1
```

## Usage

Here is a simple example of how to use the `CheckAnimationScreen`:

```dart
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

```

## Additional information

For more information, check the [documentation](https://flutter.dev/docs) or visit the [GitHub repository](https://github.com/lualbertovargas/check_animation).

## Changelog

### 0.0.1
- Initial release of the Check Animation package with basic functionality.
