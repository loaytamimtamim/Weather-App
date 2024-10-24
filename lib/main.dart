import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project4/provider/weather_provider.dart';
import 'package:project4/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
