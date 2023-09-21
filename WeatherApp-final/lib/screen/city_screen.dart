import 'package:flutter/material.dart';
import 'package:weather_project/constants.dart';
import 'package:weather_project/models/weather.dart';
import 'package:weather_project/screen/weather_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () async {
                    Weather weather = Weather();

                    dynamic weatherData = await weather.getCurrentWeather();

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WeatherScreen(locationWeather: weatherData)));
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    city = value;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, city);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
