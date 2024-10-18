import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';


abstract class WeatherRepository {
  Future<Weather> getWeather(String city);
  
}
