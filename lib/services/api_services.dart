import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nimbus_now/models/nimbus_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIServices {
  static final String apiKey = dotenv.env['API_KEY'] ?? 'No Key Found';

  static Future<List<NimbusModel>> getSuggestions(String query) async {
    if (query.trim().isEmpty) {
      return [
        NimbusModel(city: 'Pune', state: 'Maharashtra', country: 'IN'),
        NimbusModel(city: 'Bengaluru', state: 'Karnataka', country: 'IN'),
        NimbusModel(city: 'London', state: 'England', country: 'UK'),
      ];
    }

    final uri = Uri.https('api.openweathermap.org', '/geo/1.0/direct', {
      'q': query,
      'limit': '5',
      'appid': apiKey,
    });
    final response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> cityData = jsonDecode(response.body);

        return cityData
            .where((json) {
              final queryLower = query.toLowerCase();
              final cityLower = (json['name'] ?? '').toLowerCase();
              return cityLower.contains(queryLower);
            })
            .map((json) {
              return NimbusModel.citySuggestionsMap(json);
            })
            .toList();
      } else {
        throw 'Error fetching data: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error other than fetching data $e';
    }
  }

  static Future<Map<String, dynamic>> fetchWeatherDetails(
    String cityName,
  ) async {
    if (cityName.isEmpty) {
      cityName = 'Pune';
    }
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/forecast', {
      'q': cityName,
      'APPID': apiKey,
    });

    final response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        print('response sent');

        return jsonDecode(response.body);
      } else {
        throw 'Error fetching weather details of $cityName: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error in try catch: $e';
    }
  }
}
