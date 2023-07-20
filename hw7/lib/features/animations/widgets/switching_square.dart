import 'package:flutter/material.dart';

class SwitchingSquare extends StatefulWidget {
  const SwitchingSquare({super.key});

  @override
  State<SwitchingSquare> createState() => _SwitchingSquareState();
}

class _SwitchingSquareState extends State<SwitchingSquare> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _isTapped = !_isTapped;
      }),
      child: AnimatedSwitcher(
        switchInCurve: Curves.bounceIn,
        switchOutCurve: Curves.bounceInOut,
        duration: const Duration(seconds: 2),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: ColoredBox(
          key: ValueKey<bool>(_isTapped),
          color: _isTapped ? Colors.yellowAccent : Colors.yellow,
          child: const SizedBox(
            height: 100,
            width: 100,
            child: Center(child: Text('Click Me!')),
          ),
        ),
      ),
    );
  }
}
