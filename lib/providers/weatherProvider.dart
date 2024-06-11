import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models.dart';
class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;
  String? CityName;
  set  WeatherData (WeatherModel? weather)
  {
    _weatherData= weather;
    notifyListeners();
  }
  WeatherModel?  get weatherData
  {
    return _weatherData;
  }

}