import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.temperature,
    required super.condition,
    required super.windSpeed,
    required super.humidity,
    required super.cloudCover,
    required super.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // Safely parse forecast data with null checks
    List<WeatherDay> forecast = (json['forecast']['forecastday'] as List)
        .map((day) => WeatherDay(
              date: day['date'] ?? 'Unknown date', 
              temperature: (day['day']['avgtemp_c'] ?? 0.0).toDouble(), 
              condition: day['day']['condition']['text'] ?? 'Unknown', 
              humidity: day['day']['avghumidity'] ?? 0, 
              cloudCover: day['day']['cloud'] ?? 0, 
              dailyWillItRain: day['day']['will_it_rain'] ?? 0, // Check for correct key
            ))
        .toList();

    return WeatherModel(
      temperature: (json['current']['temp_c'] ?? 0.0).toDouble(),
      condition: json['current']['condition']['text'] ?? 'Unknown', 
      windSpeed: (json['current']['wind_kph'] ?? 0.0).toDouble(), 
      humidity: json['current']['humidity'] ?? 0, 
      cloudCover: json['current']['cloud'] ?? 0, 
      forecast: forecast,
    );
  }
    // Method to generate the condition list
  List<int> getConditionList() {
    return [
      cloudCover > 7 ? 1 : 0,    
      (condition == 'Sunny' || condition == 'Clear') ? 0 : 1,  
      windSpeed > 35 ? 1 : 0,
      temperature > 35 ? 1 : 0,    
      humidity > 4 ? 1 : 0,      
    ];
  }
}
