import 'package:intl/intl.dart';

class WeatherModel {
  String name;
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String icon;
  String weatherstate;
  WeatherModel(
      {required this.name,
      required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.icon,
      required this.weatherstate});
  factory WeatherModel.fromJson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    var dateFormatter =
        DateFormat('yyyy-MM-dd HH:mm'); // Specify the date format
    return WeatherModel(
        name: data['location']['name'],
        date: dateFormatter.parse(data['location']['localtime']),
        temp: data['current']['temp_c'],
        maxtemp: jsondata['maxtemp_c'],
        mintemp: jsondata['mintemp_c'],
        icon: data['current']['condition']['icon'],
        weatherstate: data['current']['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return '$date$icon$maxtemp$mintemp$name$temp';
  }
}
