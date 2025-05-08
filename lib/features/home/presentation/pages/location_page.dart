import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/current_location/current_location_bloc.dart';
import 'package:weather_app/features/home/presentation/widgets/current_location_header.dart';

import '../../domain/entities/weather_forecast.dart';
import '../bloc/weather/current_weather_bloc.dart';
import '../bloc/weather_forecast/weather_forecast_bloc.dart';
import '../widgets/Weather_details_section.dart';
import '../widgets/current_weather_status.dart';
import '../widgets/weather_forecast_section.dart';

// BackdropFilter(
// filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),

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
        body: Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              "https://images.unsplash.com/photo-1556525185-fc8a5a7aaa6b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3NDY5Nzd8MHwxfHNlYXJjaHwxfHxTcmklMjBMYW5rYXxlbnwwfDF8fHwxNzQ2NDE3OTc5fDA&ixlib=rb-4.0.3&q=80&w=1080",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: SafeArea(
            child: MultiBlocListener(
                listeners: [
                  BlocListener<CurrentLocationBloc, CurrentLocationBlocState>(
                    listener: (context, state) {
                      if (state is CurrentLocationBlocLoaded) {
                        context.read<WeatherForecastBloc>().add(
                            FetchWeatherForecast(position: state.position));
                        context
                            .read<CurrentWeatherBloc>()
                            .add(FetchCurrentWeather(position: state.position));
                      }
                    },
                  )
                ],
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        BlocBuilder<CurrentLocationBloc,
                                CurrentLocationBlocState>(
                            builder: (context, state) {
                          if (state is CurrentLocationBlocError) {
                            return const CurrentLocationHeader(
                              country: "Unknown",
                              location: "Unknown",
                            );
                          }
                          if (state is CurrentLocationBlocLoaded) {
                            return CurrentLocationHeader(
                              country: state.position.country,
                              location: state.position.locationName,
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        }),
                        const SizedBox(
                          height: 60,
                        ),
                        BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                            builder: (context, state) {
                          if (state is CurrentWeatherError) {
                            return Center(child: Text('Error: ${state.error}'));
                          }
                          if (state is CurrentWeatherLoaded) {
                            return Column(
                              children: [
                                CurrentWeatherStatus(weather: state.weather),
                                const SizedBox(
                                  height: 60,
                                ),
                                WeatherDetailsSection(weather: state.weather),
                              ],
                            );
                          }

                          return const Center(
                              child: CircularProgressIndicator());
                        }),
                        const SizedBox(
                          height: 60,
                        ),
                        BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
                            builder: (context, state) {
                          if (state is WeatherForecastError) {
                            return Center(child: Text('Error: ${state.error}'));
                          }

                          if (state is WeatherForecastLoaded) {
                            final List<List<WeatherForecastElement>>?
                                listOfWeatherForecasts =
                                state.weather.weatherForecasts;

                            if (listOfWeatherForecasts == null ||
                                listOfWeatherForecasts.isEmpty) {
                              return const Center(
                                  child: Text('No forecast data available.'));
                            }
                            return Column(
                              children: listOfWeatherForecasts
                                  .map((weather) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: WeatherForecastSection(
                                          weatherElements: weather,
                                        ),
                                      ))
                                  .toList(),
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        })
                      ],
                    ),
                  ),
                )),
          ),
        )
      ],
    ));
  }
}

// MultiBlocListener(
// listeners: [
// BlocListener<CurrentLocationBloc, CurrentLocationBlocState>(
// listener: (context, state) {
// if (state is CurrentLocationBlocLoaded) {
// context
//     .read<WeatherForecastBloc>()
//     .add(FetchWeatherForecast(position: state.position));
// context
//     .read<CurrentWeatherBloc>()
//     .add(FetchCurrentWeather(position: state.position));
// }
// },
// )
// ],
// child: Column(
// children: [
// BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
// builder: (context, state) {
// if (state is CurrentWeatherLoading) {
// return const Center(child: CircularProgressIndicator());
// } else if (state is CurrentWeatherLoaded) {
// final weather = state.weather;
//
// return Center(
// child: Text(
// 'Location: ${weather.locationName}\nCondition: ${weather.weatherCondition}\nTemp: ${weather.temp}'),
// );
// } else if (state is CurrentWeatherError) {
// return Center(child: Text('Error: ${state.error}'));
// }
// return Container();
// },
// ),
// // BlocBuilder<CurrentLocationBloc, CurrentLocationBlocState>(
// //   builder: (context, state) {
// //     if (state is CurrentLocationBlocLoading) {
// //       return const Center(child: CircularProgressIndicator());
// //     }
// //     return Container();
// //   },
// // ),
// // BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
// //   builder: (context, state) {
// //     if (state is WeatherForecastLoading) {
// //       return const Center(child: CircularProgressIndicator());
// //     }
// //     return Container();
// //   },
// // )
// ],
// ),
// ),
