
import 'package:flutter/material.dart';

Row temperatureDetail() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        size: 60,
        color: Colors.white,
      ),
      SizedBox(width: 20),
      Column(
        children: [
          Text(
            '14 °F',
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.w200),
          ),
          Text(
            'LIGHT SNOW',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ],
  );
}