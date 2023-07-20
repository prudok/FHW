import 'package:flutter/material.dart';

class HeroSquare extends StatelessWidget {
  const HeroSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'square',
      child: ColoredBox(
        color: Colors.purple,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text('Hero App Bar')),
                  body: const Hero(
                    tag: 'square',
                    child: Center(
                      child: ColoredBox(
                        color: Colors.purpleAccent,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          child: const SizedBox(
            height: 100,
            width: 100,
            child: Material(
              color: Colors.transparent,
              child: Center(child: Text('Click me!')),
            ),
          ),
        ),
      ),
    );
  }
}
