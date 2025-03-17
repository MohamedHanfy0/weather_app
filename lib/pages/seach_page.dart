
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joooooooooooooooo/cubits/cubit/weather_cubit.dart';

class SeachPage extends StatelessWidget {
   SeachPage({super.key});

  void getData(context) async {
    BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
    Navigator.pop(context);
  }
    String? cityName;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Seach Weather"),
       
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
