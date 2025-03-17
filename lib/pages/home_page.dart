import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joooooooooooooooo/cubits/cubit/weather_cubit.dart';
import 'package:joooooooooooooooo/models/weather_model.dart';
import 'package:joooooooooooooooo/pages/seach_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weahterModel;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => SeachPage()));
        },
        child: Icon(Icons.next_plan, color: Colors.orange),
      ),
      appBar: AppBar(title: Text("Weather App")),

      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherFailure) {
            return Center(child: Text('Error Weather'));
          } else if (state is WeatherSuccess) {
            weahterModel = BlocProvider.of<WeatherCubit>(context).weatherModel;

            return SuccessBody(
              weahterModel: weahterModel,
              cityName: BlocProvider.of<WeatherCubit>(context).cityNameCubit!,
            );
          } else {
            return DefultBody();
          }
        },
      ),
    );
  }
}

class DefultBody extends StatelessWidget {
  const DefultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.weahterModel,
    required this.cityName,
  });

  final WeatherModel? weahterModel;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3),
          Text(
            cityName,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text("updated ${weahterModel!.date}", style: TextStyle(fontSize: 18)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https:${weahterModel!.icon}'),
              Text(
                "${weahterModel!.temp.toInt()}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('maxTemp: ${weahterModel!.maxTemp.toInt()}'),
                  Text('minTemp: ${weahterModel!.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            weahterModel!.weatherStateName,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}
