import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model.dart/weather_model.dart';

class WeatherServices {
  Future<WeatherModel> getweater({required String city}) async {
    String baseurl = 'http://api.weatherapi.com/v1';
    String urlkey = 'd4cb07ef95dc45f9bc7201939232207';
    Uri url = Uri.parse('$baseurl/forecast.json?key=$urlkey&q=$city&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
