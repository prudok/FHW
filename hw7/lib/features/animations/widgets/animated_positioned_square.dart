import 'package:flutter/material.dart';

class AnimatedPosSquare extends StatefulWidget {
  const AnimatedPosSquare({super.key});

  @override
  State<AnimatedPosSquare> createState() => _AnimatedPosSquareState();
}

class _AnimatedPosSquareState extends State<AnimatedPosSquare> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _isTapped = !_isTapped;
      }),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeInOutCubicEmphasized,
              bottom: _isTapped ? 0 : 100,
              right: _isTapped ? 0 : 100,
              duration: const Duration(milliseconds: 300),
              child: ColoredBox(
                color: _isTapped ? Colors.blue : Colors.blueAccent,
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(child: Text('Click Me!')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
