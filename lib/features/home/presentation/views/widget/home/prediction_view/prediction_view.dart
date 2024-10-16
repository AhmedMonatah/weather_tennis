import 'package:flutter/material.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/prediction_view/Prediction_view_body.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart'; // Import the Weather entity

class PreductionView extends StatelessWidget {
  static const routeName = 'PreductionView';

  // Add a Weather parameter to the constructor
  final Weather weather;

  const PreductionView({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.PrimaryHomeColor,),
      backgroundColor: AppColor.PrimaryHomeColor, // dark blue background
      body: PredictionViewBody(weather: weather), // Pass the weather object
    );
  }
}
