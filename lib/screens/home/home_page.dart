//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:final_620710291/models/weather.dart';
import 'package:final_620710291/screens/home/weather_list_item.dart';
import 'package:flutter/material.dart';

import '../../repositories/weather_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var value1 = false;

  @override
  void initState() {
    super.initState();
    var data = WeatherRepository.readJsonData(
        'https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=bangkok');
    data.then(getResult);
  }

  getResult(String result) {
    debugPrint(result);
    List list = jsonDecode(result);
    //list.map((item) => Toilet.fromJson(item)).toList();
    List<Weather> toiletList = list.map((item) {
      return Weather.fromJson(item);
    }).toList();

    setState(() {
      WeatherRepository.weather = toiletList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Nakhon Pathom',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'THAILAND',
                  style: TextStyle(
                    color: Color.fromARGB(255, 52, 57, 57),
                    fontSize: 13.5,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '2023-10-16  11:33',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.5,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(30.0),
                  ),
                Icon(Icons.sunny),
                Text(
                  'Not Rainy\n',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  '36.4',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Feels like 40.0 ํC',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    value1=!value1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '  ํ C  |  ํ F  ',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
