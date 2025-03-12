import 'package:flutter/material.dart';
import 'package:joooooooooooooooo/models/weather_model.dart';

class WeahterProvider extends ChangeNotifier {
  WeatherModel? _weatherModelData;

  String? cityName;
  set weatherModelData(WeatherModel? weather) {
    _weatherModelData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherModelData => _weatherModelData;
}
