import 'package:flutter/material.dart';

class WeatherModel {

   DateTime? weathertime ;
   double? temp ;
   double? MaxTemp;
   double? minTemp ;
   String? weatherstatusName;
   String? icon ;
  WeatherModel({required this.weathertime, required this.temp,
    required this.MaxTemp, required this.minTemp,required this.weatherstatusName,
    required this.icon});
 factory WeatherModel.fromJson(Map<String , dynamic> data){
    var jsondata = data["forecast"]["forecastday"][0]["day"];
   return WeatherModel(
       weathertime: DateTime.parse(data["current"]["last_updated"]),
       temp: jsondata["avgtemp_c"],
       MaxTemp:jsondata["maxtemp_c"],
       minTemp: jsondata["mintemp_c"],
       weatherstatusName: jsondata["condition"]["text"],
       icon:jsondata["condition"]["icon"],
   );
  }
  @override
  String toString() {
    return 'temp: $temp , date: $weathertime' ;
  }
   MaterialColor getThemeColor() {
     if (weatherstatusName == 'Sunny' || weatherstatusName == 'Clear' ||  weatherstatusName == 'partly cloudy') {
       return Colors.orange;
     } else if (
     weatherstatusName == 'Blizzard' ||  weatherstatusName == 'Patchy snow possible'  ||  weatherstatusName == 'Patchy sleet possible' || weatherstatusName == 'Patchy freezing drizzle possible' || weatherstatusName == 'Blowing snow') {
       return Colors.blue;
     } else if (weatherstatusName == 'Freezing fog' || weatherstatusName == 'Fog' ||  weatherstatusName == 'Heavy Cloud' || weatherstatusName == 'Mist' || weatherstatusName == 'Fog') {
       return Colors.blueGrey;
     } else if (weatherstatusName == 'Patchy rain possible' ||
         weatherstatusName == 'Heavy Rain' ||
         weatherstatusName == 'Showers	') {
       return Colors.blue;
     } else if (weatherstatusName == 'Thundery outbreaks possible' || weatherstatusName == 'Moderate or heavy snow with thunder' || weatherstatusName == 'Patchy light snow with thunder'|| weatherstatusName == 'Moderate or heavy rain with thunder' || weatherstatusName == 'Patchy light rain with thunder' ) {
       return Colors.deepPurple;
     } else {
       return Colors.orange;
     }
   }
}