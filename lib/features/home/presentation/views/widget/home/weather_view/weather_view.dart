import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/weather_view/weather_bloc_consumer.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});
  static const routeName = 'weather_view';

  @override
  Widget build(BuildContext context) {
    return const WeatherBlocConsumer();
  }
}