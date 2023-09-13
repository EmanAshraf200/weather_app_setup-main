import 'package:flutter/material.dart';

import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/weatherresult.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weatherprovider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Searchpage(),
        routes: {
          'result': (context) => WeatherResult(),
        },
      ),
    );
  }
}
