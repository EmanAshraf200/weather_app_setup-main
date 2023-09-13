import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weatherprovider.dart';

class WeatherResult extends StatefulWidget {
  const WeatherResult({Key? key}) : super(key: key);

  @override
  State<WeatherResult> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WeatherResult> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<WeatherProvider>(context, listen: false).weather != null
        ? Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/cloud-in-blue-sky.jpg', // Replace with your background image asset path
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 250,
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(top: 15, left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    '${Provider.of<WeatherProvider>(context).weather!.name}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.black45,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'updated at : ${Provider.of<WeatherProvider>(context).weather!.date.day.toString()}:${Provider.of<WeatherProvider>(context).weather!.date.minute.toString()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.black45,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 50),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      ' ${Provider.of<WeatherProvider>(context).weather!.weatherstate}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 22,
                                          ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '${Provider.of<WeatherProvider>(context).weather!.temp.toInt()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            color: Colors.black45,
                                          ),
                                    ),
                                    Text(
                                      'min: ${Provider.of<WeatherProvider>(context).weather!.mintemp.toInt()} / max:  ${Provider.of<WeatherProvider>(context).weather!.maxtemp.toInt()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Transform.scale(
                                      scale: 2.0,
                                      child: Image.network(
                                        'https:${Provider.of<WeatherProvider>(context).weather!.icon}',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: Container(
              child: Text(
                'loading...',
                style: TextStyle(fontSize: 15),
              ),
            ),
          );
  }
}
