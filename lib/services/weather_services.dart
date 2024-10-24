import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project4/models/weather.dart';

class WeatherServices {
  String buseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '7e765ea46231498d91d155222242409';

  // this is function for get of server ((getWeather))
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$buseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    http.Response response = await http.get(url);

    // JsonDecode
    // take string and convers => to jsom ((map))
    Map<String, dynamic> data = jsonDecode(response.body);

    // convers data json to class WeatherModel
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
