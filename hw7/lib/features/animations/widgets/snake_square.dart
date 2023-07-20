import 'package:flutter/material.dart';

class SnakeSquare extends StatefulWidget {
  const SnakeSquare({super.key});

  @override
  State<SnakeSquare> createState() => _SnakeSquareState();
}

class _SnakeSquareState extends State<SnakeSquare>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 50.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.forward();
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.purpleAccent,
            margin: EdgeInsets.only(
              left: 50 - _animation.value,
              right: 50 - _animation.value,
            ),
            child: const Center(child: Text('Click me!')),
          );
        },
      ),
    );
  }
}
