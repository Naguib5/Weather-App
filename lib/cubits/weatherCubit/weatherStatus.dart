import 'package:weatherapp/models.dart';

abstract class Weatherstate {}

class weatherIntial extends Weatherstate {}

class weatherLoading extends Weatherstate {}

class weatherSuccess extends Weatherstate {
  WeatherModel weatherModel;
  weatherSuccess({required this.weatherModel});
}

class weatherFailure extends Weatherstate {}
