import 'package:flutter/material.dart';

Column cityDetail() {
  return const Column(
    children: [
      Text(
        'Murmansk Oblast, RU',
        style: TextStyle(
          fontSize: 33,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Friday, Mar 20, 2020',
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}