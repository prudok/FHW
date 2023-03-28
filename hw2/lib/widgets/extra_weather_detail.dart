import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Row extraWeatherDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      extraWeatherDetailTile('5', 'km/hr'),
      extraWeatherDetailTile('3', '%'),
      extraWeatherDetailTile('20', '%'),
    ],
  );
}

Column extraWeatherDetailTile(String temperature, String subtitle) {
  return Column(
    children: [
      const Icon(
        CupertinoIcons.snow,
        size: 40,
        color: Colors.white,
      ),
      Text(
        temperature,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        subtitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w200,
        ),
      ),
    ],
  );
}