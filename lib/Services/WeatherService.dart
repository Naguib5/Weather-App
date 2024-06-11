
import 'dart:convert';
import 'package:http/http.dart'as http ;
import 'package:weatherapp/models.dart';
class WeatherService
{
  String BaseUrl = 'http://api.weatherapi.com/v1';
  String APikey = '3c654c6be038418c8ce24141232204';
  Future<WeatherModel?> getWeather ({required String Cityname} )async
  {
    WeatherModel? weatherModel;
     try{
       Uri uri  = Uri.parse(
           '$BaseUrl/forecast.json?key=$APikey&q=$Cityname&days=1'
       );
       http.Response response= await http.get(uri);
       Map<String , dynamic> data = jsonDecode(response.body);
       print(data);
       weatherModel= WeatherModel.fromJson(data);
     }catch (e){
       print(e);
     };
    return weatherModel;
  }
}