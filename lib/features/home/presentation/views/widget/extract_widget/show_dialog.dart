import 'package:flutter/material.dart';

void showPredictionDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('🌟 Training Prediction 🌟'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('👍 OK'),
          ),
        ],
      );
    },
  );
}