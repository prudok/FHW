import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hw2/widgets/city_detail.dart';
import 'package:hw2/widgets/city_name.dart';
import 'package:hw2/widgets/extra_weather_detail.dart';
import 'package:hw2/widgets/temperature_detail.dart';
import 'package:hw2/widgets/weather_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: appbar('Weather Forecast'),
        body: Column(
          children: [
            const SizedBox(height: 15),
            cityName(),
            const SizedBox(height: 25),
            cityDetail(),
            const SizedBox(height: 40),
            temperatureDetail(),
            const SizedBox(height: 40),
            extraWeatherDetail(),
            const SizedBox(height: 40),
            const Text(
              '7-Day WEATHER FORECAST',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              height: 100,
              child: weatherList(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appbar(String title) {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text(title),
      centerTitle: true,
      shadowColor: Colors.transparent,
    );
  }
}
