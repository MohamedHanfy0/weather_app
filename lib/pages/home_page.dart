import 'package:flutter/material.dart';
import 'package:joooooooooooooooo/models/weather_model.dart';
import 'package:joooooooooooooooo/pages/seach_page.dart';
import 'package:joooooooooooooooo/providers/weahter_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weahterProvider =
        Provider.of<WeahterProvider>(context).weatherModelData;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => SeachPage()));
        },
        child: Icon(Icons.next_plan, color: Colors.orange),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        // foregroundColor: Colors.white,
        title: Text("Weather App"),
      ),
      body:
          weahterProvider == null
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'There is no weather  start \n searching now',
                      style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
              : Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [Colors.deepOrange, Colors.orange],
                //   ),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 3),
                    Text(
                      "${Provider.of<WeahterProvider>(context).cityName}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "updated ${weahterProvider.date}",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network('https:${weahterProvider.icon}'),
                        Text(
                          "${weahterProvider.temp.toInt()}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text('maxTemp: ${weahterProvider.maxTemp.toInt()}'),
                            Text('minTemp: ${weahterProvider.minTemp.toInt()}'),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      weahterProvider.weatherStateName,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
    );
  }
}
