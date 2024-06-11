import 'package:bloc/bloc.dart';
import 'package:weatherapp/Services/WeatherService.dart';
import 'package:weatherapp/cubits/weatherCubit/weatherStatus.dart';
import 'package:weatherapp/models.dart';

class WeatherCubit extends Cubit<Weatherstate> {
  WeatherCubit(this.weatherService) : super(weatherIntial());
  WeatherService? weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String citynaem}) async {
    emit(weatherLoading());
    try {
      weatherModel = await weatherService!.getWeather(Cityname: citynaem);
      emit(weatherSuccess(weatherModel: weatherModel!));
    } catch (e) {
      emit(weatherFailure());
    }
  }
}
