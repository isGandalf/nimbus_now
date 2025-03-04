import 'package:flutter/material.dart';
import 'package:nimbus_now/screens/additional_weather_details.dart';
import 'package:nimbus_now/screens/hourly_forecast.dart';

class WeatherInfo extends StatelessWidget {
  final Map<String, dynamic> weatherDataFromAPI;

  const WeatherInfo({super.key, required this.weatherDataFromAPI});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Expanded(
      // Creates a white container with rounded top corners.
      child: Container(
        decoration: BoxDecoration(
          color:
              theme.brightness == Brightness.dark
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            // Holds two main section, 1 - Hourly Forecast, 2 - Additional weather details
            children: [
              const SizedBox(height: 10),
              Text(
                '3-Hourly Forecast',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:
                      theme.brightness == Brightness.light
                          ? Colors.white
                          : Colors.black,
                ),
              ),
              //SizedBox(height: 5),
              HourlyForecast(
                forecastData: weatherDataFromAPI,
              ), // Hourly Forecast
              const SizedBox(height: 5),
              Text(
                'Additional Weather Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:
                      theme.brightness == Brightness.light
                          ? Colors.white
                          : Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              AdditionalWeatherDetails(
                forecastData: weatherDataFromAPI,
              ), // Additional weather details
            ],
          ),
        ),
      ),
    );
  }
}
