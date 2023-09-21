import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherNetworking {
  final String? _weatherApiKey = dotenv.env['WEATHER_DATA_API_KEY'];

  Future<dynamic> fetchCurrentWeather({required lat, required lon}) async {
    String weatherUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_weatherApiKey&units=metric';

    final response = await http.get(Uri.parse(weatherUrl));

    if (response.statusCode != 200) {
      throw Exception('Exception failed.');
    }

    return jsonDecode(response.body);
  }

  Future<dynamic> fetchCityWeather({required cityName}) async {
    String weatherUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_weatherApiKey&units=metric';

    final response = await http.get(Uri.parse(weatherUrl));

    if (response.statusCode != 200) {
      throw Exception('Exception failed.');
    }

    return jsonDecode(response.body);
  }
}
