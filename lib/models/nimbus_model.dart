import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NimbusModel {
  static const String appTitle = 'Nimbus Now';
  final double? currentTemp;
  final String? description;
  final Widget? icondata;
  final String? city;
  final String? country;
  final String? state;

  NimbusModel({
    this.icondata,
    this.currentTemp,
    this.description,
    this.city,
    this.country,
    this.state,
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

  factory NimbusModel.citySuggestionsMap(Map<String, dynamic> json) {
    return NimbusModel(
      city: json['name'],
      state: json['state'],
      country: json['country'],
    );
  }

  factory NimbusModel.fetchWeatherDetails(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return NimbusModel(
        currentTemp: 0.0,
        description: '--',
        icondata: Icon(Icons.signal_wifi_connected_no_internet_4_rounded),
        city: '--',
        country: '--',
        state: '--',
      );
    }
    return NimbusModel(
      currentTemp: json['list'][0]['main']['temp'] - 273.15,
      description: json['list'][0]['weather'][0]['main'],
      icondata: fetchIcon(json['list'][0]['weather'][0]['main']),
      city: json['city']['name'],
      country: json['city']['country'],
    );
  }

  // factory NimbusModel.fromUserSelectedCity(String selectedCity) {
  //   if (selectedCity.isEmpty) throw 'No cities found';
  //   final splitString = selectedCity.split(', ');
  //   return NimbusModel(
  //     city: splitString[0],
  //     country: selectedCity.length > 1 ? splitString[1] : '',
  //     currentTemp: null,
  //     description: null,
  //     icondata: null,
  //   );
  // }
}
