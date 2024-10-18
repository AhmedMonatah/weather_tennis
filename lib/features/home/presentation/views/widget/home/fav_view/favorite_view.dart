import 'package:flutter/material.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'favorite_view_body.dart'; // Import the new FavoriteViewBody widget

class FavoriteView extends StatelessWidget {
  static const routeName = 'favoriteView';

  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.PrimaryHomeColor,
      body:  FavoriteViewBody(),
  );
  }
}