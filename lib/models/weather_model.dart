// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String icon;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.icon,
  });

 factory WeatherModel.fromJson(dynamic data) {
    var jonsData = data['forecast']['forecastday'][0]['day'];
   return  WeatherModel(
      date: data['location']['localtime'],
      temp: jonsData['avgtemp_c'],
      maxTemp: jonsData['maxtemp_c'],
      minTemp: jonsData['mintemp_c'],
      weatherStateName: jonsData['condition']['text'], icon: jonsData['condition']['icon'],
    );

    
  }

  @override
  String toString() {
    return 'Data = $date Temp $temp ';
  }
}
