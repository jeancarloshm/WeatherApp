import 'package:geolocator/geolocator.dart';
import 'package:weather_project/models/networking.dart';

class Location {
  late double longitude;
  late double latitude;

  Future<dynamic> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.reduced);

    latitude = position.latitude;
    longitude = position.longitude;

    WeatherNetworking networking = WeatherNetworking();

    return await networking.fetchCurrentWeather(lat: latitude, lon: longitude);
  }
}
