import 'package:flutter/material.dart';
import 'package:project4/models/weather.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData =>
      _weatherData; // لا تستخدم null check operator هنا
}
