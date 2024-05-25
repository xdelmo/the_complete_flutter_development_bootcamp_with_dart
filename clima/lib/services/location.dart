import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Location();
  Future<void> getCurrentLocationCheckingPermissions() async {
    try {
      LocationPermission locationPermission =
          await Geolocator.requestPermission();

      if (LocationPermission.whileInUse == locationPermission ||
          LocationPermission.always == locationPermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.lowest);
        latitude = position.latitude;
        longitude = position.longitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
