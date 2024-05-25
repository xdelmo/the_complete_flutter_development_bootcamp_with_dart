import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    try {
      await location.getCurrentLocationCheckingPermissions();
    } catch (e) {
      print('An error occurred: $e');
    }
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&appid=$apiKey'
            as Uri);

    if (response.statusCode == 200) {
      String data = response.body;
      final decodeData = jsonDecode(data);

      String weatherDescription = decodeData['weather'][0]['description'];
      double temp = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Get Location'),
      ),
    );
  }
}
