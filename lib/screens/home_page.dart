import 'package:flutter/material.dart';
import 'package:nimbus_now/models/nimbus_model.dart';
import 'package:nimbus_now/screens/main_card.dart';
import 'package:nimbus_now/screens/weather_info.dart';
import 'package:nimbus_now/services/api_services.dart';

class NimbusHome extends StatefulWidget {
  const NimbusHome({super.key});

  @override
  State<NimbusHome> createState() => _NimbusHomeState();
}

class _NimbusHomeState extends State<NimbusHome> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      // App Bar
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          NimbusModel.appTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        // Refresh Button
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                APIServices().fetchWeatherDetails();
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: APIServices().fetchWeatherDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.hasError.toString()));
          }
          final weatherInfo = NimbusModel.fromJson(snapshot.data!);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '${weatherInfo.city}, ${weatherInfo.country}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:
                        theme.brightness == Brightness.dark
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : Colors.black,
                  ),
                ),
              ),
              // main card (shows current temp, icon and sky status)
              MainCard(weatherInfo: weatherInfo),
              SizedBox(height: 20),
              // More weather information section (show forecast and additional weather information details)
              WeatherInfo(weatherDataFromAPI: snapshot.data!),
            ],
          );
        },
      ),
    );
  }
}
