import 'package:bloc/bloc.dart';
import 'package:joooooooooooooooo/models/weather_model.dart';
import 'package:joooooooooooooooo/sevice/weather_service.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityNameCubit;

  getWeather({required String cityName}) async {
    cityNameCubit = cityName;
    try {
      emit(WeatherLoading());
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
