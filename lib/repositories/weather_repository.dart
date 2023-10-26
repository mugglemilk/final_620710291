import 'package:flutter/services.dart';

import '../models/weather.dart';


class WeatherRepository {
  static List<Weather> weather = [
    Weather(name: 'toilet 1', point: 1.5, distance: 150.0),
    Weather(name: 'toilet 2', point: 5.0, distance: 160.0),
    Weather(name: 'toilet 3', point: 4.5, distance: 170.0),
    Weather(name: 'toilet 4', point: 3.5, distance: 180.0),
    Weather(name: 'toilet 5', point: 3.0, distance: 190.0),
  ];
  static Future<String> readJsonData(String path) async {
    //read json file
    return await rootBundle.loadString(path);
  }
}