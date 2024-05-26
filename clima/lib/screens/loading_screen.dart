import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  static const apiKey = '42ff6742f692b37d116b3c3ef1751003';

  double? latitude;
  double? longitude;

  @override
  initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    try {
      await location.getCurrentLocationCheckingPermissions();
      NetworkHelper networkHelper = NetworkHelper(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'));
      var weatherData = await networkHelper.getData();
      // print(weatherData);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        }),
      );
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
