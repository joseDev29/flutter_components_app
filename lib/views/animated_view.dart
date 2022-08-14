import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:components_app/theme/app_theme.dart';

class AnimatedView extends StatefulWidget {
  const AnimatedView({Key? key}) : super(key: key);

  @override
  State<AnimatedView> createState() => _AnimatedViewState();
}

class _AnimatedViewState extends State<AnimatedView> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.amber;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(16);

  bool isPaused = true;

  void changeBox() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius =
          BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    });
  }

  void onPlay() {
    setState(() => isPaused = false);
    Timer.periodic(
      const Duration(milliseconds: 400),
      (timer) => isPaused ? timer.cancel() : changeBox(),
    );
  }

  void onPause() {
    setState(() => isPaused = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          width: _height,
          height: _width,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isPaused ? onPlay : onPause,
        backgroundColor: isPaused ? AppTheme.primaryColor : Colors.pink,
        child: Icon(
          isPaused ? Icons.play_circle_outline : Icons.pause_circle_outline,
          size: 30,
        ),
      ),
    );
  }
}
