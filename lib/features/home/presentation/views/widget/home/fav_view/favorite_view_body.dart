import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/fav_cubit/fav_cubit.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, List<String>>(
      builder: (context, favCities) {
        if (favCities.isEmpty) {
          return const Center(
            child: Text(
              '🌟 No cities favorited yet. 🌟',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return ListView.builder(
          itemCount: favCities.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 5,
              color: Colors.blueGrey[800],
              child: ListTile(
                title: Text(
                  favCities[index],
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    BlocProvider.of<FavoritesCubit>(context)
                        .toggleFavorite(favCities[index]);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}