import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_project/models/location.dart';
import 'package:weather_project/models/weather.dart';
import 'package:weather_project/screen/weather_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location? location;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Weather weather = Weather();

    dynamic weatherData = await weather.getCurrentWeather();

    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherScreen(locationWeather: weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitChasingDots(
      color: Colors.blue.shade900,
    )));
  }
}
