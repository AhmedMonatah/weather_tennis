// location_helper.dart
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> getCurrentLocationAndCity({
  required TextEditingController cityController,
  required BuildContext context,
}) async {
  bool serviceEnabled;
  LocationPermission permission;

  try {
    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        print("Location permissions are denied.");
        return;
      }
    }

    // Try to get the current position
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Get the placemarks from the coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    // Check if placemarks are not empty and set the city
    if (placemarks.isNotEmpty) {
      String? city = placemarks.first.locality;
      cityController.text = city ?? '';
    } else {
      print("No placemarks found.");
    }
  } catch (e) {
    // Handle specific error cases
    if (e is PlatformException) {
      print('Failed to get location: ${e.message}');
      if (e.code == 'IO_ERROR') {
        print("Location services may be temporarily unavailable.");
      }
    } else {
      print('An unexpected error occurred: $e');
    }
  }
}
