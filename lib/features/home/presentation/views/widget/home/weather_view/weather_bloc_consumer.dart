import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/bottom_navigation_bar.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/weather_view/weather_view_body.dart';

class WeatherBlocConsumer extends StatelessWidget {
  const WeatherBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the WeatherCubit to get the current city
    final weatherCubit = context.read<WeatherCubit>();
    final currentCity = weatherCubit.currentCity;

    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44), // dark blue background
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            return WeatherViewBody(weather: state.weather);
          } else if (state is WeatherError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Retry fetching weather for the current city
                      weatherCubit.fetchWeather(currentCity);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'No weather data available',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}