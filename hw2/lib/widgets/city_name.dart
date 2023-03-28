import 'package:flutter/material.dart';

Row cityName() {
  return const Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: 10),
      Icon(
        Icons.loupe_sharp,
        color: Colors.white,
        size: 25,
      ),
      SizedBox(width: 18),
      Text(
        'Enter City Name',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ],
  );
}
