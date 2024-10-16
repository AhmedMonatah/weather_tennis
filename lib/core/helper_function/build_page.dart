import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/fav_view/favorite_view_body.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/prediction_view/Prediction_view.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/search_view/search_view.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/weather_view/weather_view_body.dart';

List<Widget> buildPages(BuildContext context) {
  return [
    BlocBuilder<WeatherCubit, WeatherState>(
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
                const Text(
                  'Oops! Something went wrong.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'We couldn\'t fetch the weather data. Please try again later.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      SearchView.routeName,
                    );
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
    const FavoriteViewBody(),
    // Adding Prediction Page with weather data
    BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return PreductionView(weather: state.weather);
        } else {
          return const Center(
            child: Text(
              'No prediction data available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    ),
  ];
}
