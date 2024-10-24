import 'package:flutter/material.dart';
import 'package:project4/models/weather.dart';
import 'package:project4/provider/weather_provider.dart';
import 'package:project4/services/weather_services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({this.updatui});
  String? cityName;
  VoidCallback? updatui;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Search Page',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            style: TextStyle(color: Colors.blue, fontSize: 20),
            // استقبال البيانات
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices weatherServices = WeatherServices();
              WeatherModel? weather =
                  await weatherServices.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;

              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              updatui!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: Text(
                'search',
                style: TextStyle(fontSize: 20),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 22, horizontal: 20),
              hintText: 'Enter your city',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
