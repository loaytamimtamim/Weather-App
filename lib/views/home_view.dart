import 'package:flutter/material.dart';
import 'package:project4/models/weather.dart';
import 'package:project4/provider/weather_provider.dart';
import 'package:project4/views/search_page.dart';
import 'package:project4/widgets/no_weather_body.dart';
import 'package:project4/widgets/weather_info_body.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // الحصول على بيانات الطقس من WeatherProvider
    WeatherModel? loay =
        Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                  updatui: updateUI, // استخدام الاسم المحدث
                );
              }));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.blue,
      ),
      body: loay == null
          ? NoWeatherBody() // إضافة co nst لتحسين الأداء
          : WeatherInfoBody(), // تمرير weatherData
    );
  }
}
