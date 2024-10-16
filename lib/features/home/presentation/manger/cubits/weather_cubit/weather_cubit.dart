import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/auth/data/domin/usecase/get_weather_usecase.dart';
import 'weather_state.dart';
class WeatherCubit extends Cubit<WeatherState> {
  final GetWeather getWeather;
  String currentCity = '';

  WeatherCubit(this.getWeather) : super(WeatherInitial());

  // Fetch weather by city name
  Future<void> fetchWeather(String city) async {
    currentCity = city; // Set the current city whenever you fetch weather
    emit(WeatherLoading());

    try {
      final weather = await getWeather.call(city);
      emit(WeatherSuccess(weather));
        } catch (e) {
      log('Error fetching weather for $city: $e');
      emit(WeatherError('Failed to fetch weather for $city: ${e.toString()}'));
    }
  }
}