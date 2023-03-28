import 'package:flutter/material.dart';

ListView weatherList() {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: 7,
    itemBuilder: (BuildContext context, int index) {
      return weatherBlock();
    },
    separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(width: 10);
    },
  );
}

Container weatherBlock() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Colors.white30,
    ),
    child: const Column(
      children: [
        Text(
          'Friday',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '6 °F',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.wb_sunny,
              size: 40,
              color: Colors.white,
            ),
          ],
        ),
      ],
    ),
  );
}
