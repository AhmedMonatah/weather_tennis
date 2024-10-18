import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';
import 'package:weather_app/features/home/auth/data/domin/repos/weather_repository.dart';
import 'package:weather_app/features/home/auth/data/model/weather_model.dart';
class WeatherRepositoryImpl implements WeatherRepository {
  final String apiKey = '';

  @override
  Future<Weather> getWeather(String city) async {
    final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      throw Exception("Failed to fetch weather data");
    }
  }

}
