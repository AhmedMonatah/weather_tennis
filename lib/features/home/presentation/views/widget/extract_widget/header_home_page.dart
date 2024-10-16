
import 'package:flutter/material.dart';
import 'package:weather_app/core/helper_function/get_user.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      
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
        const SizedBox(height: 8),
          Text(
            getUser().name,
            style: const TextStyle(
              fontSize: 30,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}


