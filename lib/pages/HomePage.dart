import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubits/weatherCubit/weatherCubit.dart';
import 'package:weatherapp/cubits/weatherCubit/weatherStatus.dart';
import 'package:weatherapp/models.dart';
import 'package:weatherapp/pages/SearchPage.dart';
import 'package:weatherapp/providers/weatherProvider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherdata;

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, Weatherstate>(builder: (context, state) {
        if (state is weatherLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is weatherSuccess) {
          weatherdata = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return SuccessBody(weather: state.weatherModel);
        } else if (state is weatherFailure) {
          return Center(child: Text('something went wrong please try again '));
        } else {
          return DefaultBody();
        }
      }),
    );
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'there is no weather 😔 start searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class SuccessBody extends StatelessWidget {
  SuccessBody({
    super.key,
    required this.weather,
  });

  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    weather = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
          color: weather?.getThemeColor(),
          gradient: LinearGradient(
            colors: [
              weather!.getThemeColor(),
              weather!.getThemeColor()[300]!,
              weather!.getThemeColor()[100]!,
            ]!,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          Column(
            children: [
              Text(
                '${BlocProvider.of<WeatherCubit>(context).cityName}',
                style: TextStyle(
                  fontSize: 44,
                ),
              ),
              Text(
                'Updated:${weather!.weathertime!.hour.toString()}:${weather!.weathertime!.minute.toString()}',
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network('http:${weather!.icon}'),
              Text(
                '30',
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Max:${weather!.MaxTemp!.toInt()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Min:${weather!.minTemp!.toInt()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            '${weather!.weatherstatusName}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Spacer(
            flex: 8,
          ),
        ],
      ),
    );
  }
}
