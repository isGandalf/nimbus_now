import 'package:flutter/material.dart';
import 'package:nimbus_now/models/nimbus_model.dart';
import 'package:nimbus_now/screens/main_card.dart';
import 'package:nimbus_now/screens/weather_info.dart';

class NimbusHome extends StatefulWidget {
  const NimbusHome({super.key});

  @override
  State<NimbusHome> createState() => _NimbusHomeState();
}

class _NimbusHomeState extends State<NimbusHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          NimbusModel.appTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        // Refresh Button
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // main card (shows current temp, icon and sky status)
          MainCard(),
          SizedBox(height: 20),
          // More weather information section (show forecast and additional weather information details)
          WeatherInfo(),
        ],
      ),
    );
  }
}
