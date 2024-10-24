import 'package:flutter/material.dart';
import 'package:project4/models/weather.dart';
import 'package:project4/provider/weather_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WeatherInfoBody extends StatefulWidget {
  @override
  State<WeatherInfoBody> createState() => _WeatherInfoBodyState();
}

class _WeatherInfoBodyState extends State<WeatherInfoBody> {
  @override
  Widget build(BuildContext context) {
    // الحصول على قيمة المدينة من WeatherProvider
    String cityName =
        Provider.of<WeatherProvider>(context).cityName ?? 'No value';

    WeatherModel? dataVuio = Provider.of<WeatherProvider>(context).weatherData;

    // التحقق من أن weatherData ليست null

    return Container(
      color: const Color.fromARGB(176, 228, 233, 225),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              '${dataVuio!.time}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  dataVuio.getImage(),
                ),
                Text(
                  '${dataVuio.avegTemp.toInt()}', // استخدام ! بعد التأكد من أن weatherData ليست null
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text('maxTemp: ${dataVuio.maxTemp.toDouble()}'),
                    Text('minTemp: ${dataVuio.minTemp.toInt()}'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              dataVuio.weatherStateName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
