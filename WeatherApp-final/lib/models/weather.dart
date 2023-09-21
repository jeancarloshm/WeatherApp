import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_project/models/location.dart';
import 'package:weather_project/models/networking.dart';

final String? weatherApiKey = dotenv.env['WEATHER_DATA_API_KEY'];

class Weather {
  Future<dynamic> getCurrentWeather() async {
    Location location = Location();

    return await location.getLocation();
  }

  Future<dynamic> getCityWeather({required cityName}) async {
    WeatherNetworking networkHelper = WeatherNetworking();

    dynamic response = await networkHelper.fetchCityWeather(cityName: cityName);

    return response;
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
