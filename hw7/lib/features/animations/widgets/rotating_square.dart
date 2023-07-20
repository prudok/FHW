import 'package:flutter/material.dart';

class RotatingSquare extends StatefulWidget {
  const RotatingSquare({super.key});

  @override
  State<RotatingSquare> createState() => _RotatingSquareState();
}

class _RotatingSquareState extends State<RotatingSquare> {
  double _turns = 100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _turns += 1;
      }),
      child: AnimatedRotation(
        duration: const Duration(seconds: 3),
        curve: Curves.bounceIn,
        turns: _turns,
        child: const ColoredBox(
          color: Colors.orange,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(child: Text('Click Me!')),
          ),
        ),
      ),
    );
  }
}
