import 'package:flutter/material.dart';
import 'package:joooooooooooooooo/models/weather_model.dart';
import 'package:joooooooooooooooo/pages/home_page.dart';
import 'package:joooooooooooooooo/providers/weahter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeahterProvider(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          // primarySwatch: Colors.deepPurple,
          primaryColor: Colors.amber,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
