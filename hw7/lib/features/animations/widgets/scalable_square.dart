import 'package:flutter/material.dart';

class ScalableSquare extends StatefulWidget {
  const ScalableSquare({super.key});

  @override
  State<ScalableSquare> createState() => _ScalableSquareState();
}

class _ScalableSquareState extends State<ScalableSquare> {
  double _size = 100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _size = _size == 100 ? 150 : 100;
      }),
      child: ColoredBox(
        color: Colors.red,
        child: AnimatedSize(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: SizedBox(
            height: _size,
            width: _size,
            child: const Center(child: Text('Click Me!')),
          ),
        ),
      ),
    );
  }
}
