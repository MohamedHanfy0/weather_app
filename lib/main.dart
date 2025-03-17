import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joooooooooooooooo/cubits/cubit/weather_cubit.dart';
import 'package:joooooooooooooooo/pages/home_page.dart';
import 'package:joooooooooooooooo/sevice/weather_service.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService()),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
         
          primaryColor: Colors.amber,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
