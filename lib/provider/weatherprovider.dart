import 'package:flutter/material.dart';
import 'package:weather_app/model.dart/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weather;
  set weather(WeatherModel? weatherModel) {
    _weather = weatherModel;
    notifyListeners();
  }

  WeatherModel? get weather => _weather;
}
