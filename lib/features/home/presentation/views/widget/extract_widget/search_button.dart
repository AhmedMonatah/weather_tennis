
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/weather_view/weather_view.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.cityController, required this.title,
  });

  final TextEditingController cityController;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final city = cityController.text;
          context.read<WeatherCubit>().fetchWeather(city);
       Navigator.pushReplacementNamed(context, WeatherView.routeName);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding:
              const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}