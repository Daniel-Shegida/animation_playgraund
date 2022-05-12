import 'package:flutter/material.dart';

class TweenBuilderAnimation extends StatefulWidget {
  const TweenBuilderAnimation({Key? key}) : super(key: key);

  @override
  State<TweenBuilderAnimation> createState() => _TweenBuilderAnimationState();
}

class _TweenBuilderAnimationState extends State<TweenBuilderAnimation> {
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: targetValue),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget? child) {
        return IconButton(
          iconSize: size,
          color: Colors.blue,
          icon: child!,
          onPressed: () {
            setState(() {
              targetValue = targetValue == 24.0 ? 48.0 : 24.0;
            });
          },
        );
      },
      child: const Icon(Icons.aspect_ratio),
    );
  }
}

