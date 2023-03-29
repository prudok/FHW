import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Hw4());
}

class Hw4 extends StatelessWidget {
  const Hw4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ColorsProvider>.value(
            value: ColorsProvider(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorsProvider colorsProvider = Provider.of<ColorsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Homework 4',
          style: TextStyle(color: colorsProvider.colorAppbarText),
        ),
        backgroundColor: colorsProvider.colorAppbar,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: 200,
              width: 200,
              decoration: BoxDecoration(color: colorsProvider.colorSquare),
              duration: const Duration(milliseconds: 500),
            ),
            Switch(
              onChanged: (bool value) {
                colorsProvider.setRandColor();
                colorsProvider.setIsSwitched(value);
              },
              value: colorsProvider.isSwitched,
            ),
          ],
        ),
      ),
    );
  }
}

class ColorsProvider extends ChangeNotifier {
  bool isSwitched = false;
  Color colorAppbar = Colors.red;
  Color colorAppbarText = Colors.yellow;
  Color colorSquare = Colors.green;

  void setIsSwitched(bool value) {
    isSwitched = value;
    notifyListeners();
  }

  void setRandColor() {
    colorAppbar =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    colorAppbarText =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    colorSquare =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    notifyListeners();
  }
}
