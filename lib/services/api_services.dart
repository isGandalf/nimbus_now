import 'dart:convert';
import 'package:http/http.dart' as http;

class APIServices {
  Future<Map<String, dynamic>> fetchWeatherDetails() async {
    try {
      const url =
          'https://api.openweathermap.org/data/2.5/forecast?q=Pune&APPID=a8a1f91c38a9b881ae22c006a844741b';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        throw 'Status code: ${response.statusCode}';
      }
      return jsonDecode(response.body);
    } catch (e) {
      throw e.toString();
    }
  }
}
