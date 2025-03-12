import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:joooooooooooooooo/models/weather_model.dart';
import 'package:joooooooooooooooo/providers/weahter_provider.dart';
import 'package:joooooooooooooooo/sevice/weather_service.dart';
import 'package:provider/provider.dart';

class SeachPage extends StatelessWidget {
  String? cityName;

  void getData(context) async {
    WeatherModel? weather = await WeatherService().getWeather(
      cityName: cityName!,
    );
    // ignore: use_build_context_synchronously
    Provider.of<WeahterProvider>(context, listen: false).weatherModelData =
        weather;
    
    // ignore: use_build_context_synchronously
    Provider.of<WeahterProvider>(context, listen: false).cityName = cityName;

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seach Weather"),
        // backgroundColor: Colors.blue,
        // foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: TextField(
          onChanged: (value) {
            cityName = value;
          },
          onSubmitted: (data) {
            cityName = data;
            getData(context);
          },
          decoration: InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(color: Colors.blue),
            hintText: 'Enter a City',
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            suffixIcon: InkWell(
              onTap: () {
                getData(context);
              },
              child: Icon(Icons.search, color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
