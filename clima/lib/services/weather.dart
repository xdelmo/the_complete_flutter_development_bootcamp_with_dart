import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  static const apiKey = '42ff6742f692b37d116b3c3ef1751003';
  static const openWeatherMapURL =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    print("object");
    try {
      await location.getCurrentLocationCheckingPermissions();
      NetworkHelper networkHelper = NetworkHelper(Uri.parse(
          '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'));
      return await networkHelper.getData();
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<dynamic> getCityWeather(cityName) async {
    Location location = Location();
    await location.getCurrentLocationCheckingPermissions();
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        '$openWeatherMapURL?q=${cityName}&appid=$apiKey&units=metric'));
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
