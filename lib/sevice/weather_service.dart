import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '9a649fd9fc9742ff8f492532250503';

  void getWeather({required String cityName}) async {
    Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
    );
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    String date = data['location']['localtime'];
    String temp = data['forecast']['forecastday'][0]['avgtemp_c'];

    print(data);
  }
}
