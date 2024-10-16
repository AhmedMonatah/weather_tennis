import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/fav_cubit/fav_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/search_view/search_view.dart';

class AppBarHomePage extends StatefulWidget {
  final IconData icon;
  final String cityName;

  const AppBarHomePage({super.key, required this.icon, required this.cityName});

  @override
  _AppBarHomePageState createState() => _AppBarHomePageState();
}

class _AppBarHomePageState extends State<AppBarHomePage> {
  bool isToggled = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorited();
  }

  void _checkIfFavorited() {
    final favCities = BlocProvider.of<FavoritesCubit>(context).state;
    setState(() {
      isToggled = favCities.contains(widget.cityName);
    });
  }

  void _toggleIcon() {
    BlocProvider.of<FavoritesCubit>(context).toggleFavorite(widget.cityName);
    setState(() {
      isToggled = !isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesCubit, List<String>>(
      listener: (context, favCities) {
        setState(() {
          isToggled = favCities.contains(widget.cityName);
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08, // Adjust height as needed
        color: AppColor.PrimaryHomeColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  SearchView.routeName,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite, // Always use the heart icon
                color: isToggled ? Colors.red : Colors.white,
              ),
              onPressed: _toggleIcon, // Toggle favorite icon
            ),
          ],
        ),
      ),
    );
  }
}
