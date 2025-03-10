import 'package:flutter/material.dart';
import 'package:joooooooooooooooo/sevice/weather_service.dart';

class SeachPage extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seach Weather"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: TextField(
          onSubmitted: (data) {
            cityName = data;
            WeatherService().getWeather(cityName: cityName!);
          },
          decoration: InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(color: Colors.blue),
            hintText: 'Enter a City',
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            suffixIcon: Icon(Icons.search, color: Colors.blue),
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
