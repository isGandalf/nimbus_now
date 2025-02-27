import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NimbusModel {
  static const String appTitle = 'Nimbus Now';
  final double currentTemp;
  final String description;
  final Widget icondata;
  final String city;
  final String country;

  NimbusModel({
    required this.icondata,
    required this.currentTemp,
    required this.description,
    required this.city,
    required this.country,
  });

  static Widget fetchIcon(String iconLabel) {
    switch (iconLabel) {
      case 'Thunderstorm':
        return Lottie.asset('assets/animations/thunderstorm.json');
      case 'Drizzle'
          'Rain':
        return Lottie.asset('assets/animations/rain.json');
      case 'Snow':
        return Lottie.asset('assets/animations/snow.json');
      case 'Mist'
          'Smoke'
          'Haze'
          'Dust'
          'Fog':
        return Lottie.asset('assets/animations/mist-smoke-haze-dust-fog.json');
      case 'Sand'
          'Ash'
          'Squall':
        return Lottie.asset('assets/animations/sand-ash-squall.json');
      case 'Tornado':
        return Lottie.asset('assets/animations/tornado.json');
      case 'Clear': // Icon done
        return Lottie.asset('assets/animations/clear.json');
      case 'Clouds':
        return Lottie.asset('assets/animations/clouds.json');
      default:
        return Icon(Icons.cloud); // Default icon
    }
  }

  factory NimbusModel.fromJson(Map<String, dynamic> json) {
    return NimbusModel(
      currentTemp: json['list'][0]['main']['temp'] - 273.15,
      description: json['list'][0]['weather'][0]['main'],
      icondata: fetchIcon(json['list'][0]['weather'][0]['main']),
      city: json['city']['name'],
      country: json['city']['country'],
    );
  }
}
