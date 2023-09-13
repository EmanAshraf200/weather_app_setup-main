import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model.dart/weather_model.dart';
import 'package:weather_app/provider/weatherprovider.dart';
import 'package:weather_app/services/weatherservices.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  String? city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/cloud-in-blue-sky.jpg', // Replace with your background image asset path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20),
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (data) async {
                city = data;
                WeatherServices weatherServices = WeatherServices();
                WeatherModel weatherModel =
                    await weatherServices.getweater(city: city!);
                Provider.of<WeatherProvider>(context, listen: false).weather =
                    weatherModel;
                Navigator.pushNamed(context, 'result');
                print(weatherModel);
              },
              decoration: InputDecoration(
                suffix: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Search'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
