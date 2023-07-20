import 'package:birthday_app/features/animations/widgets/animated_positioned_square.dart';
import 'package:birthday_app/features/animations/widgets/hero_square.dart';
import 'package:birthday_app/features/animations/widgets/rotating_square.dart';
import 'package:birthday_app/features/animations/widgets/scalable_square.dart';
import 'package:birthday_app/features/animations/widgets/snake_square.dart';
import 'package:birthday_app/features/animations/widgets/switching_square.dart';
import 'package:flutter/material.dart';

class AnimationView extends StatelessWidget {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation View'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScalableSquare(),
              RotatingSquare(),
              SwitchingSquare(),
              AnimatedPosSquare(),
              SnakeSquare(),
              HeroSquare(),
            ],
          ),
        ),
      ),
    );
  }
}
