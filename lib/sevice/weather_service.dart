import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:joooooooooooooooo/models/weather_model.dart';

class WeatherService {
  

  

  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '9a649fd9fc9742ff8f492532250503';
  Future<WeatherModel?> getWeather({required String cityName}) async {

WeatherModel? weatherModel;

try {
   Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
    );
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    weatherModel = WeatherModel.fromJson(data);
    
} catch (e) {
  
}
return weatherModel;
  }
}
