import 'package:flutter/material.dart';
import 'package:nimbus_now/screens/additional_weather_details.dart';
import 'package:nimbus_now/screens/hourly_forecast.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Expanded(
      // Creates a white container with rounded top corners.
      child: Container(
        decoration: BoxDecoration(
          color:
              theme.brightness == Brightness.dark ? Colors.white : Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          // Holds two main section, 1 - Hourly Forecast, 2 - Additional weather details
          children: [
            SizedBox(height: 10),
            Text(
              'Hourly Forecast',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color:
                    theme.brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
              ),
            ),
            SizedBox(height: 5),
            HourlyForecast(), // Hourly Forecast
            SizedBox(height: 5),
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
            SizedBox(height: 20),
            AdditionalWeatherDetails(), // Additional weather details
          ],
        ),
      ),
    );
  }
}
