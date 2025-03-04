import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nimbus_now/models/nimbus_model.dart';

class HourlyForecast extends StatelessWidget {
  final Map<String, dynamic> forecastData;
  const HourlyForecast({super.key, required this.forecastData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 155,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 10),
          itemCount: forecastData['list'].length - 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (listViewContext, index) {
            final prefix = forecastData['list'];
            final rawtime = prefix[index + 1]['dt'];
            final hourlyUpdate = DateFormat.jm().format(
              DateTime.fromMillisecondsSinceEpoch(rawtime * 1000),
            );
            final String label = prefix[index + 1]['weather'][0]['main'];
            final double hourlyTemp =
                prefix[index + 1]['main']['temp'] - 273.15;
            return Card(
              elevation: 5,
              shadowColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(hourlyUpdate, style: const TextStyle(fontSize: 18)),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: NimbusModel.fetchIcon(label),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${hourlyTemp.toStringAsFixed(2)} °C',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
