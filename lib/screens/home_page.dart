import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  String selectedCity = 'London';
  final TextEditingController controllerCity = TextEditingController();
  Future<Map<String, dynamic>>? forecastFuture;

  @override
  void initState() {
    super.initState();
    controllerCity.text = selectedCity;
    forecastFuture = APIServices.fetchWeatherDetails(selectedCity);
  }

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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                forecastFuture = APIServices.fetchWeatherDetails(selectedCity);
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(width: 180, height: 40, child: selectCity()),
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: forecastFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.hasError.toString()));
              }

              // Storing the data from API and converting to dart
              final weatherInfo = NimbusModel.fetchWeatherDetails(
                snapshot.data!,
              );
              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // main card (shows current temp, icon and sky status)
                    MainCard(weatherInfo: weatherInfo),
                    const SizedBox(height: 10),
                    // More weather information section (show forecast and additional weather information details)
                    WeatherInfo(weatherDataFromAPI: snapshot.data!),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget selectCity() {
    return TypeAheadField<NimbusModel>(
      debounceDuration: Duration(milliseconds: 500),
      controller: controllerCity,
      itemBuilder: (context, NimbusModel suggestions) {
        final cities = suggestions;
        final stateCountry = '${cities.state ?? ''}, ${cities.country ?? ''}';
        return ListTile(
          title: Text('${cities.city}'),
          subtitle: Text(stateCountry),
        );
      },
      onSelected: (NimbusModel cityName) {
        setState(() {
          selectedCity = cityName.city!;
          controllerCity.text = selectedCity;
          forecastFuture = APIServices.fetchWeatherDetails(selectedCity);
        });
        FocusScope.of(context).unfocus();
      },
      suggestionsCallback: APIServices.getSuggestions,
      builder: (context, controllerCity, focusNode) {
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextField(
            controller: controllerCity,
            focusNode: focusNode,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.blue,
              prefixStyle: TextStyle(color: Colors.white),
              suffixIcon: Icon(Icons.location_on),
              suffixIconColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.white,
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
