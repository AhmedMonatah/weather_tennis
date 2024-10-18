import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class PredictionHelper {
  // Method to generate the condition list from weather data
  static List<int> getConditionList(Weather weather) {
    final selectedWeather = weather.forecast[0]; // Assuming first day forecast for simplicity
    return [
      selectedWeather.cloudCover > 70 ? 1 : 0, // Cloud cover
      (selectedWeather.condition == 'Sunny' || selectedWeather.condition == 'Clear') ? 0 : 1, // Condition
      selectedWeather.dailyWillItRain > 35 ? 1 : 0, // Will it rain
      selectedWeather.temperature > 35 ? 1 : 0, // Temperature
      selectedWeather.humidity > 80 ? 1 : 0, // Humidity
    ];
  }

  // Method to call the prediction API and return the result
  static Future<String> getPrediction(List<int> features) async {
    final url = Uri.parse('');
    Map<String, dynamic> body = {'features': features};

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final prediction = json.decode(response.body)['prediction'];
        return prediction == 1
            ? 'You can do training today'
            : 'Sorry, you cannot do training today';
      } else {
        return 'Failed to get prediction';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
