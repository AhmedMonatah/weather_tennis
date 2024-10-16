import 'package:flutter/material.dart';
import 'package:weather_app/core/utiles/app_icon.dart';
import 'package:weather_app/core/utiles/app_text_styles.dart';

AppBar BuildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,  // Set the background color to transparent
    elevation: 0,  // Remove the shadow if you prefer
    leading: title == 'New Account'
        ? IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white), // Ensure the icon is visible on the image
          )
        : null,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.regular50.copyWith(color: Colors.white), // Adjust text color
    ),
    flexibleSpace: Image.asset(
      AssetPaths().imageSign,  // Replace with your image path
      fit: BoxFit.cover,  // Make sure the image covers the whole app bar
    ),
  );
}
