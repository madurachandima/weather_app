import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/current_location/current_location_bloc.dart';

import '../bloc/weather/current_weather_bloc.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    context.read<CurrentLocationBloc>().add(FetchLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Location')),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CurrentLocationBloc, CurrentLocationBlocState>(
            listener: (context, state) {


              if (state is CurrentLocationBlocLoaded) {
                context
                    .read<CurrentWeatherBloc>()
                    .add(FetchCurrentWeather(position: state.position));
              }
            },
          )
        ],
        child: Column(
          children: [
            BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
              builder: (context, state) {
                if (state is CurrentWeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CurrentWeatherLoaded) {
                  final weather = state.weather;

                  return Center(
                    child: Text(
                        'Location: ${weather.locationName}\nCondition: ${weather.weatherCondition}\nTemp: ${weather.temp}'),
                  );
                } else if (state is CurrentWeatherError) {
                  return Center(child: Text('Error: ${state.error}'));
                }
                return Container();
              },
            ),
            BlocBuilder<CurrentLocationBloc, CurrentLocationBlocState>(
              builder: (context, state) {
                if (state is CurrentLocationBlocLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
