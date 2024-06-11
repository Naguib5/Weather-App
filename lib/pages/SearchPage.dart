import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Services/WeatherService.dart';
import 'package:weatherapp/cubits/weatherCubit/weatherCubit.dart';
import 'package:weatherapp/models.dart';

class SearchPage extends StatelessWidget {
  SearchPage();
  String? CityName;
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (data) async {
                CityName = data;
              },
              onSubmitted: (data) async {
                CityName = data;
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(citynaem: CityName!);
                BlocProvider.of<WeatherCubit>(context).cityName = CityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 34, horizontal: 16),
                  hintText: 'Enter City Name',
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        WeatherService service = WeatherService();
                        WeatherModel? weather =
                            await service.getWeather(Cityname: CityName!);
                        // Provider.of<WeatherProvider>(context,listen: false).WeatherData= weather;
                        // Provider.of<WeatherProvider>(context,listen: false).CityName= CityName;
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.search)),
                  label: Text('search'),
                  border: OutlineInputBorder()),
            ),
          )
        ],
      ),
    );
  }
}
