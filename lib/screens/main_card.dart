import 'package:flutter/material.dart';
import 'package:nimbus_now/models/nimbus_model.dart';

class MainCard extends StatelessWidget {
  final NimbusModel weatherInfo;
  const MainCard({super.key, required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    return MainCardDesign(
      currentTemp: '${weatherInfo.currentTemp!.toStringAsFixed(2)} °C',
      icon: weatherInfo.icondata,
      description: weatherInfo.description,
    );
  }
}

class MainCardDesign extends StatelessWidget {
  final String? currentTemp;
  final Widget? icon;
  final String? description;

  const MainCardDesign({
    super.key,
    required this.currentTemp,
    required this.icon,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  currentTemp!,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: NimbusModel.fetchIcon(description!),
                ),
                const SizedBox(height: 10),
                Text(
                  description!,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
