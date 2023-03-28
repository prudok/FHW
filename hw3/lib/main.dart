import 'package:flutter/material.dart';
import 'package:hw3/pages/user_form_page.dart';

void main() {
  runApp(const Hw3());
}

class Hw3 extends StatefulWidget {
  const Hw3({super.key});

  @override
  State<Hw3> createState() => _Hw3State();
}

class _Hw3State extends State<Hw3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserFormPage(),
    );
  }

}
