import 'package:flutter/material.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/search_view/search_view_body.dart';

class SearchView extends StatelessWidget {

  const SearchView({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.PrimaryHomeColor,),
      backgroundColor: AppColor.PrimaryHomeColor, // dark blue background
      body: const SearchViewBody(),
      
    );
  }
}