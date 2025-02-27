import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdditionalWeatherDetails extends StatelessWidget {
  final Map<String, dynamic> forecastData;
  const AdditionalWeatherDetails({super.key, required this.forecastData});

  @override
  Widget build(BuildContext context) {
    final prefix = forecastData['list'][0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdditionalWeatherDetailsCardDesign(
          icon: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Lottie.asset(
              'assets/animations/humidity.json',
              width: 70,
              height: 70,
            ),
          ),
          dataLabel: 'Humidity',
          unit: prefix['main']['humidity'].toString(),
        ),
        AdditionalWeatherDetailsCardDesign(
          icon: Lottie.asset(
            'assets/animations/windtwo.json',
            width: 70,
            height: 70,
          ),
          dataLabel: 'Wind Speed',
          unit: prefix['wind']['speed'].toString(),
        ),
        AdditionalWeatherDetailsCardDesign(
          icon: Lottie.asset('assets/animations/pressure.json'),
          dataLabel: 'Pressure',
          unit: prefix['main']['pressure'].toString(),
        ),
      ],
    );
  }
}

class AdditionalWeatherDetailsCardDesign extends StatelessWidget {
  final Widget icon;
  final String dataLabel;
  final String unit;

  const AdditionalWeatherDetailsCardDesign({
    super.key,
    required this.icon,
    required this.dataLabel,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        elevation: 10,
        shadowColor: Color.fromARGB(255, 100, 100, 100),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(width: 50, height: 50, child: icon),
              SizedBox(height: 10),
              Text(dataLabel, style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Text(unit, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
