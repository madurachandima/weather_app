import 'package:flutter/foundation.dart';
import 'package:weather_app/core/model/response.dart';
import 'package:weather_app/features/home/domain/entities/weather.dart';

import '../../domain/entities/position.dart';
import '../../domain/repositories/current_weather_repository.dart';
import '../datasources/current_weather_data_source.dart';
import '../models/current_weather/current_weather_model.dart';

class CurrentWeatherRepositoryImpl extends CurrentWeatherRepository {
  final CurrentWeatherDataSource currentWeatherDataSource;

  CurrentWeatherRepositoryImpl({required this.currentWeatherDataSource});

  @override
  Future<Weather> getCurrentWeather(PositionEntity position) async {
    try {
      final Response response =
          await currentWeatherDataSource.getCurrentWeatherData(position);

      if (!response.success) {
        throw Exception(response.message);
      }

      CurrentWeatherModel currentWeatherModel = response.data;

      return Weather(
          weatherCondition: currentWeatherModel.weather?[0].main,
          weatherDescription: currentWeatherModel.weather?[0].description,
          weatherConditionId: currentWeatherModel.weather?[0].id,
          temp: currentWeatherModel.main?.temp,
          humidity: currentWeatherModel.main?.humidity,
          windSpeed: currentWeatherModel.wind?.speed,
          sunrise: currentWeatherModel.sys?.sunrise,
          sunset: currentWeatherModel.sys?.sunset,
          locationName: currentWeatherModel.name);
    } catch (e) {
      if (kDebugMode) {
        print("getCurrentWeather error -> $e");
      }
      throw Exception("Something went wrong");
    }
  }
}
