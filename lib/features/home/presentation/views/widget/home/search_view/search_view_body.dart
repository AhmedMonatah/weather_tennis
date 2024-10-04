import 'package:flutter/material.dart';
import 'package:weather_app/core/helper_function/get_current_location_and_city.dart';
import 'package:weather_app/core/helper_function/get_user.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/custome_home_text_field.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/search_button.dart';

class SearchViewBody extends StatefulWidget {
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Use the helper function
    getCurrentLocationAndCity(cityController: cityController, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello',
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 8),
          Text(
            getUser().name,
            style: const TextStyle(
              fontSize: 30,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            heightFactor: 4,
            child: CustomeHomeTextField(cityController: cityController),
          ),
          const SizedBox(height: 16),
          SearchButton(cityController: cityController, title: 'Search'),
        ],
      ),
    );
  }
}
