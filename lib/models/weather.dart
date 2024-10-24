class WeatherModel {
  String time;
  double avegTemp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.time,
      required this.avegTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        time: data['location']['localtime'],
        avegTemp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_f'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  String getImage() {
    if (weatherStateName == 'thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'rainy') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
