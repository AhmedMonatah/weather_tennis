import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/app_bar_home_page.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/condation_weather.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/header_home_page.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/weather_chart.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/weather_forecast_list.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/weather_metrics.dart';

class WeatherViewBody extends StatefulWidget {
  final Weather weather;

  const WeatherViewBody({required this.weather});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherViewBody> {
  int selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedWeather = widget.weather.forecast[selectedDayIndex];
    final weatherCubit = context.read<WeatherCubit>();
    final cityName = weatherCubit.currentCity;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarHomePage(icon: Icons.favorite, cityName: cityName),
          CondationWeather(selectedWeather: selectedWeather),
          const SizedBox(height: 30),
          WeatherForecastList(
            weather: widget.weather,
            selectedDayIndex: selectedDayIndex,
            onDaySelected: (index) {
              setState(() {
                selectedDayIndex = index;
              });
            },
          ),
          const SizedBox(height: 30),
          WeatherMetrics(
            selectedWeather: selectedWeather,
            weather: widget.weather,
          ),
          const SizedBox(height: 30),
          WeatherChart(
            weather: widget.weather,
            selectedWeather: selectedWeather,
          ),
        ],
      ),
    );
  }
}