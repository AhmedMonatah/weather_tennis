import 'package:flutter/material.dart';
import 'package:weather_app/core/helper_function/prediction_helper.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/show_dialog.dart';

class PredictionViewBody extends StatefulWidget {
  final Weather weather;

  const PredictionViewBody({super.key, required this.weather});

  @override
  _PredictionViewBodyState createState() => _PredictionViewBodyState();
}

class _PredictionViewBodyState extends State<PredictionViewBody> {
  String predictionMessage = '';

  // Method to fetch the prediction using the helper class
  Future<String> fetchPrediction() async {
    try {
      if (widget.weather.forecast.isNotEmpty) {
        List<int> features = PredictionHelper.getConditionList(widget.weather);
        return await PredictionHelper.getPrediction(features);
      } else {
        return '🌧️ No forecast data available.';
      }
    } catch (e) {
      return '⚠️ Error fetching prediction: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🔍 Click the check icon to see your prediction!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          IconButton(
            icon: const Icon(
              Icons.check,
              size: 50,
              color: Colors.blueAccent,
            ),
            onPressed: () async {
              String result = await fetchPrediction();
              showPredictionDialog(
                  context, result); // Pass context to the dialog
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Your prediction will be displayed in a dialog ✨',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
